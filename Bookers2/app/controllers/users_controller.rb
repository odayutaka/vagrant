class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@books = Book.all
	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  end

  private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
