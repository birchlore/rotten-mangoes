class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:title)
    @movies = @movies.filter_title(params[:title]) if params[:title].present?
    @movies = @movies.filter_director(params[:director]) if params[:director].present?
    @movies = @movies.filter_length(params[:runtime_in_minutes]) if params[:runtime_in_minutes].present?
  end


  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end


  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  protected


  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :description, :image, :remote_image_url)
  end


end
