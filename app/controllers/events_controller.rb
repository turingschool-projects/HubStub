class EventsController < ApplicationController
  def index
    all_events = Item.active.not_in_cart(session[:cart]).map(&:event).uniq
    @events = all_events.select { |event| event.category.name == params[:category] } if params[:category]
  end

  def show
    @event = Event.find_by(id: params[:id])
    @items = @event.items.paginate(:page => params[:page], :per_page => 20)
  end

  def random
    if Event.count > 0
      offset = rand(Event.active.count)
      event = Event.active.offset(offset).first
      redirect_to event
    else
      redirect_to root_path
    end
  end
end
