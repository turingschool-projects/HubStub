class EventsController < ApplicationController
  def index
    all_events = Item.active.not_in_cart(session[:cart]).map(&:event).uniq
    @events = all_events.select { |event| event.category.name == params[:category] } if params[:category]
  end

  def show
    @event = Event.find_by(id: params[:id])
    @items = @event.items.paginate(:page => params[:page], :per_page => 50)
  end

  def random
    if Event.count > 0
      redirect_to Event.find(rand(Event.count))
      # redirect_to Event.rand
      # event = Event.find(rand(Event.count))
    else
      redirect_to root_path
    end
  end
end
