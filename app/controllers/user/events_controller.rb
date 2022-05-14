class User::EventsController < ApplicationController
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to events_path
  end

  def show
  end

  def index
  end

  def edit
  end

  private
  def event_params
  params.require(:event).permit(:genre_id, :all_time, :title, :day, :time, :introduction, :fee, :preparation, :remarks)
  end
  
  private
  def schedule_params
  params.require(:schedule).permit(:start_time)
  end
end
