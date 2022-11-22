class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
    @movie.save
  end

private

def movie_params
  params.require(:movie).permit(:title, :release_date, :description, :poster, :price, :movie_type, :address, :user_id)
end

def set_movie
  @movie = Movie.find(params[:id])
end

end
