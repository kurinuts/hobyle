class User::MemoriesController < ApplicationController

  def new
    @memory = Memory.new
    @event_users = EventUser.where(user_id: current_user.id)
    # pp @event_users.pluck(:event_id)
    @events = Event.where(id: @event_users.pluck(:event_id))

    @events_select = {'参加済みイベント'=>{},'企画したイベント'=>{}}
    #{ハッシュ型：キー名変えられる(項目名が存在するものとかに利用)
    #[]配列型：キー名は変えられない・・値（id）だけ選択
    events = Event.where(id: @event_users.pluck(:event_id))
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
    @event_users = EventUser.where(user_id: current_user.id)
    @memory = Memory.new(memory_params)
    @memory.user_id = current_user.id
    @user = current_user
    if @memory.save
      redirect_to memories_path
    else
      @events = Event.where(id: @event_users.pluck(:event_id))
      @events_select = {'参加済みイベント'=>{},'企画したイベント'=>{}}
      #{ハッシュ型：キー名変えられる(項目名が存在するものとかに利用)
      #[]配列型：キー名は変えられない・・値（id）だけ選択
      events = Event.where(id: @event_users.pluck(:event_id))
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
    @memories = EventUser.all
    @event_users = EventUser.where(user_id: current_user.id)
  end

  def user_memory_index
    @memories = EventUser.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def memory_params
  params.require(:memory).permit(:user_id, :event_id, :event_user_id, :title, :comment, :image)
  end
end
