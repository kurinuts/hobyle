class User::EventUsersController < ApplicationController

  def new
    @event_user = EventUser.new
  end

  def create
    @event_user = EventUser.new(event_user_params)
    @event_user.user_id = current_user.id
    if event_user.save
      redirect_to event_users_path
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def destroy
  end

  private
  def event_user_params
  params.require(:event_users).permit(:user_id, :event_id, :member_count, :application_comment, :cancel_comment, :applicated_title, :applipated_comment, :status)
  end
end
