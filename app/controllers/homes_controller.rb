class HomesController < ApplicationController

  def top
    @genres = Genre.all.order(created_at: :desc).limit(1)
  end

  def search
    @results = @d.result
  end

  def search_genre
    @search = Genre.ransack(params[:q])

#以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
    @genres = @search.result
  end
end
