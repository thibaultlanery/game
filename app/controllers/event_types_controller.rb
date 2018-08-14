class EventTypesController < ApplicationController

  def index
    # @event_types = EventType.order(:name).where("name like ?", "%#{params[:term]}%")
    # render json: @event_types.map(&:name)
    @event_types = EventType.order(:name).where("name ilike ?", "#{params[:term].capitalize}%")
      respond_to do |format|
      format.html
      format.json {render json: @event_types.map(&:name)}
    end
  end
end
