class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create]

  def index
    @accepted_bookings = current_user.bookings.where(status: 'accepted')
    @pending_bookings = current_user.bookings.where(status: 'pending')
    @owner_venues = current_user.venues
    @bookings = Booking.all
    # @owner_bookings = Booking.where(venue: user == current_user)
  end

  def new
    @booking = @venue.bookings.build
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
    redirect_to bookings_path, notice: "Lets Fuckin' Party Man!"
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to bookings_path, notice: "Rave Rejected Asshole!"
  end

  def create
    @booking_request = current_user.bookings.new(booking_params)
    @booking_request.venue = @venue

    if @booking_request.save
      redirect_to venues_path(@booking), notice: "Booking request created!"
      else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :venue_id)
  end
end
