class StaticPagesController < ApplicationController

  def index
    @next_events = Event.active.order(:date).first(5)
    @just_added = Event.active.order(:created_at).last(2)
  end
end
