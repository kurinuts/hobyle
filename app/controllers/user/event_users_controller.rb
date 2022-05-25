class User::EventUsersController < ApplicationController

  def new
    @event_user = EventUser.new
  end

  def create
    @event_user = EventUser.new(event_user_params)
    @event_user.user_id = current_user.id
    # @event_user.event_id = @event_user.user_id.event_id
    # @event_user.event_id = Event.find(params[:id])
    @user = current_user
    if @event_user.save
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def show
    # @members = @event_user.user
    @event_user = EventUser.find(params[:id])
    @event_users = EventUser.where(event_id: @event_user.event_id)
    @user = @event_user.event.user
  end

  def index
    @event_users = EventUser.all
  end

  def edit
    @event_user = EventUser.find(params[:id])
  end

  def update
    @event_user = EventUser.find(params[:id])
    @event_user.update(event_user_params)
    if @event_user.save
      redirect_to event_user_path(@event_user.id)
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

  def memory
    @user = current_user
  end

  private
  def event_user_params
  params.require(:event_user).permit(:user_id, :event_id, :member_count, :application_comment, :cancel_comment, :applicated_title, :applipated_comment, :status)
  end
end
