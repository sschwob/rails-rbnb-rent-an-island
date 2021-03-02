class BookingsController < ApplicationController

  def index_user
    @user_bookings = current_user.bookings
  end

end
