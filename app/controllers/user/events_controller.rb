class User::EventsController < ApplicationController

  def new
    @event = Event.new
    @genres = Genre.all
    @secondgenres = Secondgenre.all
    #gon.root = ENV["root"]
    gon.root = "https://dad48620747045c19b906ef4dcfc1a1b.vfs.cloud9.us-east-1.amazonaws.com/subgenre"
  end

  def subgenre
     genre = Genre.find_by(name: params[:q])
     @subgenres = genre.secondgenres
     render json: @subgenres
  end

  def create
    @genres = Genre.all
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
    redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_user = EventUser.new
    @user = @event.user
    @genre = @event.genre
    # @secondgenre = @event.secondgenre_id
  end

  def index
    @events = Event.page(params[:page])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def my_events
    @events = Event.where(user_id: current_user.id)
  end

  private
  def event_params
  params.require(:event).permit(:genre_id, :secondgenre_id, :title, :all_time, :introduction, :limit_number, :fee, :place, :preparation, :remarks, :second_remarks, :question, :is_active).merge(daytime: params[:event][:daytime])
  end
end
