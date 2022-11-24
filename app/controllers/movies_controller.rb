class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    if params[:query].present?
      @movies = policy_scope(Movie).where(movie_type: params[:query])
    else
      @movies = policy_scope(Movie).all
    end
    @markers = @movies.geocoded.map do |movie|
      {
        lat: movie.latitude,
        lng: movie.longitude,
        info_window: render_to_string(partial: "info_window", locals: {movie: movie}),
        image_url: helpers.asset_url("/assets/cinéma_logo-9208f71acd401396f67a59cb5b1109a9531e9acead6141d4871ae488030756d7.png")
      }
    end
  end

  def show
    authorize @movie
    @booking = Booking.new
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
