class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = "You have updated user successfully."
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end

end
