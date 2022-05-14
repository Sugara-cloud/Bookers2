class UsersController < ApplicationController
  def index
    @user = @book
    @users = @current_user
  end
  
  def show
  end
  
  private
  def user_params
    params.repuire(:user).permit(:image)
  end
end
