class BookingsController < ApplicationController
  before_action :set_booking

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.movie = @movie
    @booking.user = current_user
    @booking.save
    redirect_to movies_path
  end

  private

  def booking_params
    params.require(:booking).permit(:title, :release_date, :description, :poster, :price, :movie_type, :address, :user_id)
  end

  def set_booking
    @movie = Movie.find(params[:movie_id])
  end
end
