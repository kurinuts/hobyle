class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @q = Genre.ransack(params[:q])
  end

  def search_genre
    @search = Genre.ransack(params[:q])

#以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
    @genres = @search.result
  end
end
