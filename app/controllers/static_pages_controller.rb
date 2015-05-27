class StaticPagesController < ApplicationController

  def index
    @next_events = Event.order(:date).first(5)
    @just_added = Event.order(:created_at).last(2)
  end
end
