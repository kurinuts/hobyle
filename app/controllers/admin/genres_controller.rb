class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.admin_id = current_admin.id
    if @genre.save
    redirect_to admin_genres_path
    else
    @genres = Genre.all
    render :index
    end
  end

  def index
    @genres = Genre.all
    @secondgenres = Secondgenre.all
    # @genre = Genre.find(params[:id])
  end

  def show
    @genre = Genre.find(params[:id])
    @secondgenres = @genre.secondgenres.all
  end

  def edit
    @genre = Genre.find(params[:id])
    @secondgenres = @genre.secondgenres.all
  end

  def update
    @genre = Genre.find(params[:id])
  if @genre.update(genre_params)
    redirect_to admin_genre_path(genre_params)
  else
    render :show
  end
    # @secondgenre = Secondgenre.find_by(genre_id: secondgenre_params[:genre_id])
  end

  def destroy
  @genre = Genre.find(params[:id])
  if @genre.destroy
  flash[:notice] = "ジャンルの削除に成功しました"
  redirect_to admin_genre_path(genre_params)
  else
  render :index
  end
  end

  private
  def genre_params
  params.require(:genre).permit(:name, :image)
  end

  # def secondgenre_params
  # params.require(:secondgenre.permit(:name, :genre_id))
  # end
end
