class UsersController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit

  	@user = User.find(params[:id])
  	 if current_user.id == @user.id
  	   render "users/edit"

  	 else
  	 redirect_to user_path(current_user.id)

  	 end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user_update_notice] = "You have updated user successfully."
      redirect_to  user_path(current_user)
    else
      render 'users/edit'
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
