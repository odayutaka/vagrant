class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
	  @book = Book.new
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render 'edit'
    end
  end

  private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

