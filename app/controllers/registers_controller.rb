class RegistersController < ApplicationController

  def register

    @book = Book.find(params[:id])
    @register = Register.new
    
  end

  def register_create

    @book = Book.find(params[:id])
    @exist = Register.find_by(book_id: params[:id], user_id: current_user.id)
    @register = Register.new(register_params)

    if @exist == nil
      @register.save
      redirect_to user_path(current_user)
    else
      @exist.destroy
      @register.save
      redirect_to user_path(current_user)
    end

  end

private

def register_params

  params.require(:register)
        .permit(:status)
        .merge(user_id: current_user.id, 
               book_id: @book.id,
               genre_id: @book.genre_id
              )

end

end
