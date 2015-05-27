class VenuesController < ApplicationController
  def show
    @venue = Venue.find_by(id: params[:id])
    @items = Item.joins(:event).where(events: {venue_id: @venue.id})
    @events = Event.where(venue_id: @venue.id).uniq
  end
end
