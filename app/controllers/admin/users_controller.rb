class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  private
  def user_params
  params.require(:user).permit(:image, :last_name, :first_name, :address_free, :address, :email, :phone_number, :sex, :age, :user_name, :user_introduction)
  end

end
