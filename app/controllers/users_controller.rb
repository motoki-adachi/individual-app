class UsersController < ApplicationController
  before_action :move_to_sign_in
  before_action :read_count

  
  def show
    @mounth_count = Register.mounth_count(current_user.id, 1)
    @mounth_count_values = Register.mounth_count(current_user.id, 1).values
    @mounth_count_period = Register.mounth_count(current_user.id, 1).keys
    @reading_books = Register.reading_books(current_user.id, 1)
    @register_books = Register.register_books(current_user.id).page(params[:page]).per(10)
    @register_count = Register.register_books(current_user.id).count
    gon.count_values = @mounth_count_values
    gon.count_period = @mounth_count_period
    gon.data = genre_count
    gon.genre = genre_fish
    6.times do
      gon.data
    end

  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def read_count
    @register = Register.where(user_id: current_user.id)
    @readover = @register.where(status: 1).count
    @stock = @register.where(status: 2).count
    @wants = @register.where(status: 3).count
  end

  def genre_count
    @genre_count = Register.genre_count(current_user.id, 1)
  end

  def genre_fish
    @regist_genre = []
    @genre_ids = Register.genre_ids(current_user.id, 1)
    @genre_ids.each do |genre|
      @regist_genre << Genre.find_by(id: genre).genre
    end
    return @regist_genre
  end

  def pagenate

  end

end
