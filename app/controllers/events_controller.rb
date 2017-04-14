class EventsController < ApplicationController

  def index
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }
    @alert_message = "You are viewing #{@event.game}"
  end

end
