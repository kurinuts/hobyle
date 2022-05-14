class User::UsersController < ApplicationController
#   def new
#   @user = User.new
#   end

#   def create
#   @user = @user.new(user_params)
#   @user.save
#   redirect_to user_path(current_user)
#   end

  def show
    @user = User.find(params[:id])
    @user == current_user
  end

  def index
    @genres = Genre.all
    @events = Event.all
    @applications = Application.all
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "ユーザー情報を更新しました"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private
  def user_params
  params.require(:user).permit(:image, :last_name, :first_name, :address_free, :address, :email, :phone_number, :sex, :age, :user_name, :user_introduction)
  end
end
