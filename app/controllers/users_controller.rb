class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
  end
end
