class User::EventUsersController < ApplicationController

  def new
    @event_user = EventUser.new
  end

  def create
    event = Event.find(params[:event_user][:event_id])
    if event.limit_number < (event.event_users.sum(:member_count) + params[:event_user][:member_count].to_i)
      redirect_to event_path(event.id)
      flash[:notice] = "人数制限に達しています"
      return
    end
    @event_user = EventUser.new(event_user_params)
    @event_user.user_id = current_user.id
    if @event_user.save
      flash[:notice] = "申請が完了しました"
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def show
    # @members = @event_user.user
    @event_user = EventUser.find(params[:id])
    @event_users = EventUser.where(event_id: @event_user.event_id).where.not(user_id: current_user.id)
    @user = @event_user.event.user
  end

  def index
    @event_users = EventUser.where(user_id: current_user.id)
    @user = current_user
  end


  def _participated_form
    @event_user = EventUser.find(params[:id])
  end

  def edit
    @event_user = EventUser.find(params[:id])
  end

  # def update
  #   @event_user = EventUser.find(params[:id])
  #   @event_user.update(status: "participated")
  #   # if @event_user.save
  #   #   redirect_to event_user_path(@event_user.id)
  #   # else
  #   #   render :edit
  #   # end
  # end

  def update
    @event_user = EventUser.find(params[:id])
    if @event_user.update(participated_params)
      redirect_to event_user_path(@event_user)
    else
      render :edit
    end
  end

  def cancel
    @event_user = EventUser.find(params[:id])
  end

  def destroy
    @event_user = EventUser.find(params[:id])
    if @event_user.destroy
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def event_user_params
  params.require(:event_user).permit(:user_id, :event_id, :member_count, :application_comment, :cancel_comment, :applicated_title, :applipated_comment, :status)
  end

  def participated_params
  params.require(:event_user).permit(:status)
  #require使うモデルを宣言
  #どのパラメータを許可するのかを設定
  end
end
