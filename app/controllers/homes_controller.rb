class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @q = Genre.ransack(params[:q])
  end

end
