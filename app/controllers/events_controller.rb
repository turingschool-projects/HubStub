class EventsController < ApplicationController
  def index
    # all_events = Item.map(&:event).uniq
    @events = Event.all
    # @events = all_events.select { |event| event.category.name == params[:category] } if params[:category]
  end

  def show
    @event = Event.find_by(id: params[:id])
    @items = @event.items.paginate(:page => params[:page], :per_page => 50)
  end

  def random
    total_events = Event.count
    if total_events > 0
      redirect_to Event.find(rand(total_events))
      # redirect_to Event.rand
      # event = Event.find(rand(Event.count))
    else
      redirect_to root_path
    end
  end
end
