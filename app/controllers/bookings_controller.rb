class BookingsController < ApplicationController

  def index_user
    @user_bookings = current_user.bookings
    @user_islands = current_user.islands
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
      redirect_to user_bookings_path, notice: "Booking made successfully"
    else
      render :new
    end
  end
  
  def accept
    @booking = Booking.find(params[:id])
    @booking.update(state: "Accepted")
    redirect_to user_bookings_path, notice: "Booking Accepted!"
  end
  
  def refuse
    @booking = Booking.find(params[:id])
    @booking.update(state: "Refused")
    redirect_to user_bookings_path, notice: "Booking Refused!"
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.update(state: "Canceled")
    redirect_to user_bookings_path, notice: "Booking Canceled!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :state)
  end

end
