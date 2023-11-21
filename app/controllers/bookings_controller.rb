class BookingsController < ApplicationController
  before_action :set_venue, only:[:create_request]

  def index
    @renter_bookings = current_user.bookings.where(status: 'accepted')
    @owner_venues = current_user.venues
    @owner_bookings = Booking.where(venue: @owner_venues, status: 'accepted')
  end

  def show
    @booking_request = Booking.find(params[:id])
    if @booking_request.user != current_user && @booking_request.venue.user != current_user
      redirect_to root_path, alert: "You cannot access this booking request"
    end
  end

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

  def create_request
    @booking_request = current_user.bookings.new(booking_params)
    @booking_request.venue = @venue
    @booking_request.status = "pending"

    if @booking_request.save
      redirect_to @booking, notice: "Booking request created!"
      else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :venue_id)
  end
end
