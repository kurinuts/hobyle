class User::EventsController < ApplicationController

  def new
    @event = Event.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.all
    @event = Event.new(event_params)
    if @event.save
    redirect_to events_path
    end
  end

  def show
  end

  def index
    @events = Event.all
  end

  def edit
  end

  private
  def event_params
  params.require(:event).permit(:genre_id, :user_id, :secondgenre_id, :title, :daytime, :all_time, :introduction, :limit_number, :fee, :place, :preparation, :remarks, :second_remarks, :question, :is_active)
  end

end
