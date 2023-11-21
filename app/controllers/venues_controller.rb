class VenuesController < ApplicationController
  before_action :set_venue, only: %i[show update edit destroy]
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      # @venues = Venue.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venues_path(@venue)
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, status: :see_other
  end

  private

  def venue_params
    params.require(:venue).permit(:address, :name, :description, :capacity, :bustability, :photo)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
