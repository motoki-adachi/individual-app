class BooksController < ApplicationController

  def top
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
    @genres = Genre.all
    @publisher = Publisher.all
  end

  def create
  end

end
