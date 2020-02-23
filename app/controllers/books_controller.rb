class BooksController < ApplicationController
  require 'open-uri'

  def top
    return nil if params[:keyword] == ""
    @authors = Author.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
  end

  def show

    @book = Book.find(params[:id])
    @tweet = tweet_search(@book.title)

  end
  
  def new
    @author = Author.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    @book = Book.new
    @genres = Genre.all
    @publisher = Publisher.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  private

  def tweet_search(keyword)
    # ツイート検索のオプションを記入
    twitter_params = { count: 100, lang: 'ja', result_type: 'recent', exclude: 'retweets', tweet_mode: 'extended' }
    begin
      @tweets = twitterClient.search("#読了 AND #{keyword}", **twitter_params).take(10).map do |tweet|
      {
        tweet_link: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      }
      end
    rescue => exception
      @tweets = []
    end
  end

  def twitterClient
    @twitterClient ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = 'ySOb4J12imPW1nDsPd4E1bM7d'
      config.consumer_secret = 'WvI6PtAdtrQUuoBLHwwESrYU9WiqQGaODflNpBsnJTyp8zyXZC'
      config.access_token    = '1004622479116025856-hJx8yzrKLh02G2Ya5QAn3OBVn4YvnA'
      config.access_token_secret = 'O4YbRUEKRBLxN4bjzy4tHcFQ4xeJ53pPavJuL7Bui4buV'
    end
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :publisher_id)

  end

end