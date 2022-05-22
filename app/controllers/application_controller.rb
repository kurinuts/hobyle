class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :main_visual

  def main_visual
    @users = User.all
    @events = Event.all.order(created_at: :desc).limit(1)
    @genres = Genre.all
    # @genre = @event.genre
    # @event1 = Event.where(genre_id: @genre.id)
    # @event2 = Event.where(genre_id: @genre.id)
    # @event3 = Event.where(genre_id: @genre.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :address_free, :address, :phone_number, :is_active, :user_name, :user_introduction])
  end

  def top
    @user = current_user
  end

end
