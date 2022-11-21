class MoviesController < ApplicationController

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
  
end

end
