class User::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if admin_signed_in?
      @event_users = EventUser.new
      @user = User.find(params[:id])
      @events = Event.where(user_id: @user.id)
    else
      @user = User.find(params[:id])
      @event_users = EventUser.where(user_id: current_user.id)
      @events = Event.where(user_id: @user.id)
    end
  end
  
  def edit
    @user = current_user
  end

  def my_events
    @events = Event.where(user_id: current_user.id)
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

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root # 削除に成功すればrootページに戻る
  end

  private

  def user_params
    params.require(:user).permit(:image, :last_name, :first_name, :address_free, :address, :email, :phone_number, :sex, :age, :user_name, :user_introduction)
  end
end
