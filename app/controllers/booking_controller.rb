class BookingController < ApplicationController
  def index

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to bookings_path
  end
end

private

def set_venue
  @venue = Venue.find(params[:id])
end

def venue_params
  params.require(:venue).permit(:name, :date)
end
end
