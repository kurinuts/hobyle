class User::EventsController < ApplicationController

  def new
    @event = Event.new
    @genres = Genre.all
    @secondgenres = Secondgenre.all
    #gon.root = ENV["root"]
    if Rails.env.development?#開発環境だけ表示されるよ
    gon.root = "https://dad48620747045c19b906ef4dcfc1a1b.vfs.cloud9.us-east-1.amazonaws.com/subgenre"
    else
    gon.root = 'http://75.101.221.123/subgenre'
    end
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
    @event.is_active = true
    if @event.save
      flash[:notice] = "イベントを投稿しました"
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.user
    @genre = @event.genre
    @sum = 0
    @event_users = @event.event_users
    # @event.event_user.memmber_count += params[:event][:event_user][:member_count].to_i
    if admin_signed_in?
      @event_user = EventUser.new
      #参加していたらイベントユーザーに飛ぶ
    elsif @event.event_users.exists?(user_id: current_user.id)
      @event_user = @event.event_users.find_by(user_id: current_user.id)
    else
      #参加していなかったら、new（新規）に
    @event_user = EventUser.new
    # @secondgenre = @event.secondgenre_id
    end
  end

  def index
    @events = Event.order(created_at: :desc).page(params[:page])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    # byebug
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def search
    @q = Genre.ransack(params[:q])
    @genre = @q.result[0] #配列は０から始まる
    @events = Event.where(genre_id: @genre.id).page(params[:page])
    render :index #アクションを読まないでほしいからrender使用
  end

  def active_change
    @event = Event.find(params[:event_id])
    # byebug
    if @event.update(update_is_active)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
  @event = Event.find(params[:id])
  if @event.destroy
  flash[:notice] = "successfully event_delete"
  redirect_to events_path
  else
  render :index
  end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :secondgenre_id, :title, :all_time, :introduction, :limit_number, :fee, :place, :preparation, :remarks, :second_remarks, :question, :is_active).merge(daytime: params[:event][:daytime])
  end

  def update_is_active
    params.require(:event).permit(:is_active)
  end
end
