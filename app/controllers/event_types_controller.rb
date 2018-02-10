class EventTypesController < ApplicationController

  def index
    # @event_types = EventType.order(:name).where("name like ?", "%#{params[:term]}%")
    # render json: @event_types.map(&:name)

    @event_types = EventType.order(:name).where("name like ?", "#{params[:term].capitalize}%")
    render json: @event_types.map(&:name)
  end
end
