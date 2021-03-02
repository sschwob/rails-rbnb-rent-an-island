class BookingsController < ApplicationController

  def index_user
    @user_bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @island = Island.find(params[:island_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @island = Island.find(params[:island_id])
    @booking.user = current_user
    @booking.island = @island
    if @booking.save
      redirect_to user_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :state)
  end

end
