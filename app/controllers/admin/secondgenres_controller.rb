class Admin::SecondgenresController < ApplicationController

  def new
    @secondgenre = genre.Secondgenre.new
  end

  def create
    @secondgenre = Secondgenre.new(secondgenre_params)
    @secondgenre.genre_id = params[:secondgenre][:genre_id]

    if @secondgenre.save
      redirect_to admin_genres_path
    end
  end

  def index
    @secondgenres = Secondgenre.all
  end

  def edit
    @secondgenre = Secondgenre.find(params[:id])
    @genre = @secondgenre.genre
  end

  def update
    @secondgenre = Secondgenre.find(params[:id])
    if @secondgenre.update(secondgenre_params)
    redirect_to admin_genres_path
    else
      render :show
    end
  end

  def destroy
    @secondgenre = Secondgenre.find(params[:id])
    if @secondgenre.destroy
    flash[:notice] = "詳細ジャンルの削除に成功しました"
    redirect_to admin_genres_path
    end
  end


  private
  def secondgenre_params
    params.require(:secondgenre).permit(:genre_id, :name)
  end
end
