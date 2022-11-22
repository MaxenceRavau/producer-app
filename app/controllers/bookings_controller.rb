class BookingsController < ApplicationController
  before_action :set_booking, only: [:create]

  def index
    @bookings = policy_scope(Booking).all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.movie = @movie
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to movies_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end

  def set_booking
    @movie = Movie.find(params[:movie_id])
  end
end
