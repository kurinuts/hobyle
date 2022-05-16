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
    @genre = Genre.all
    @event = Event.new(event_params)
   
    if @event.save
    redirect_to events_path
    else
      render :show
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.save
      redirect_to events_path
    end
  end

  private
  def event_params
  params.require(:event).permit(:genre_id, :user_id, :secondgenre_id, :title, :all_time, :introduction, :limit_number, :fee, :place, :preparation, :remarks, :second_remarks, :question, :is_active).merge(daytime: params[:daytime])
  end

end
