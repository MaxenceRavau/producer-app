class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = policy_scope(Movie).all
  end

  def show
    authorize @movie
  end

  def new
    @movie = Movie.new
    authorize @movie
  end

  def create
    @movie = Movie.new(movie_params)
    authorize @movie
    @movie.user = current_user
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :description, :poster, :price, :movie_type, :address, :user_id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
