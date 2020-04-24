class BooksController < ApplicationController
  before_action :move_to_index
  require 'open-uri'

  def top
    return nil if params[:keyword] == ""

    @authors = Author.where(['name LIKE ?', "%#{params[:keyword]}%"])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
    @books = Book.search(params[:q]).page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.where(author_id: @book.author_id)
    @tweet = tweet_search(@book.title)
  end

  def new
    @author = Author.where(['name LIKE ?', "%#{params[:keyword]}%"])
    @book = Book.new
    @genres = Genre.all
    @publisher = Publisher.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def tweet_search(keyword)
    twitter_params = { count: 100, lang: 'ja', result_type: 'recent', exclude: 'retweets', tweet_mode: 'extended' }
    begin
      @tweets = twitterClient.search(keyword.to_s, **twitter_params).take(10).map do |tweet|
        {
          tweet_link: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
        }
      end
    rescue StandardError => e
      @tweets = []
    end
  end

  def twitterClient
    @twitterClient ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token    = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
    end
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :publisher_id)
  end
end
