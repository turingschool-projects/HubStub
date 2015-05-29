class StaticPagesController < ApplicationController

  def index
    # @next_events = Event.order(:date).first(5)
    @next_events = Event.order(:date).limit(5)
    @just_added = Event.last(2)
  end
end
