class User::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
    event_users = EventUser.where(user_id: current_user.id).
      where(status: 2)
    @events = Event.where(id: event_users.pluck(:event_id))

    @events_select = { '参加済みイベント' => {}, '企画したイベント' => {} }
    # {ハッシュ型：キー名変えられる(項目名が存在するものとかに利用)
    # []配列型：キー名は変えられない・・値（id）だけ選択
    events = Event.where(id: event_users.pluck(:event_id))
    myEvents = current_user.events
    events.each do |e|
      @events_select['参加済みイベント'][e.title] = e.id
    end
    myEvents.each do |e|
      @events_select['企画したイベント'][e.title] = e.id
    end
    pp @events_select
  end

  def create
    event_users = EventUser.where(user_id: current_user.id).
      where(status: 2)
    @memory = Memory.new(memory_params)
    @memory.user_id = current_user.id
    @memory.event_user_id = current_user.id
    @user = current_user
    # binding.irb
    if @memory.save
      redirect_to memories_path
    else
      @events = Event.where(id: event_users.pluck(:event_id))
      @events_select = { '参加済みイベント' => {}, '企画したイベント' => {} }
      # {ハッシュ型：キー名変えられる(項目名が存在するものとかに利用)
      # []配列型：キー名は変えられない・・値（id）だけ選択
      events = Event.where(id: event_users.pluck(:event_id))
      myEvents = current_user.events
      events.each do |e|
        @events_select['参加済みイベント'][e.title] = e.id
      end
      myEvents.each do |e|
        @events_select['企画したイベント'][e.title] = e.id
      end
      render :new
    end
  end

  def index
    @memories = Memory.order(created_at: :desc).page(params[:page]).per(10)
  end

  def user_memory_index
    @memories = EventUser.all
  end

  def show
    @memory = Memory.find(params[:id])
    @user = @memory.user
    @user2 = @memory.event.user
  end

  private

  def memory_params()
    params.require(:memory).permit(:user_id, :event_id, :event_user_id, :title, :comment, :image).merge(user_id: params[:user_id]).merge(event_user_id: params[:event_user_id])
  end
end
