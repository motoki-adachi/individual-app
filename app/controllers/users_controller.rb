class UsersController < ApplicationController
  before_action :read_count
  

  def index
    @books = Book.search(params[:keyword])
    @search_count = @books.count
  end

  def show
    @mounth_count_values = Register.where(user_id: current_user.id, status: 1).group("YEAR(created_at)").group("MONTH(created_at)").count.values
    @mounth_count_period = Register.where(user_id: current_user.id, status: 1).group("YEAR(created_at)").group("MONTH(created_at)").count.keys
    @reading_books = Register.where(user_id: current_user.id, status: 1).order("created_at DESC").limit(10)
    @register_books = Register.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(10)
    gon.count_values = @mounth_count_values
    gon.count_period = @mounth_count_period
    gon.data = genre_count
    gon.genre = genre_fish
    6.times do
      gon.data
    end

  end

  private

  def read_count
    @register = Register.where(user_id: current_user.id)
    @readover = @register.where(status: 1).count
    @stock = @register.where(status: 2).count
    @wants = @register.where(status: 3).count
  end

  def genre_count
    @genre_count = Register.where(user_id: current_user.id, status: 1).pluck(:genre_id).group_by(&:itself).transform_values(&:size).values
  end

  def genre_fish
    @regist_genre = []
    @genre_ids = Register.where(user_id: current_user, status: 1).pluck(:genre_id).group_by(&:itself).keys
    @genre_ids.each do |genre|
      @regist_genre << Genre.find_by(id: genre).genre
    end
    return @regist_genre
  end

end
