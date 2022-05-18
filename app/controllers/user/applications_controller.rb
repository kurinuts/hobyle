class User::ApplicationsController < ApplicationController

  def new
  @application = event.Application.new
  end

  def create
  @application = Application.new(application_params)
  if @application.save
    redirect_to applications_path
  end
  end

  def edit
  end

  def index
    @applications = current_user.applications
    @events = @applications.events
  end

  def show
  end

  def destroy
  end

  private
  def application_params
  params.require(:application).permit(:events_id, :number, :application_comment, :cancel_comment, :cancel_comment)
  end
end
