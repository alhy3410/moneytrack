class UsersController < ApplicationController
  def index
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
