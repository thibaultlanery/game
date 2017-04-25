class EventsController < ApplicationController

  def index
    search = params[:search]
    if search
      @location = search["address"]
      # @choosen_date = Date.new search["happen_at(1i)"].to_i, search["happen_at(2i)"].to_i, search["happen_at(3i)"].to_i
      @date = Date.parse(search["date"])
      @formated_date = @date.strftime("%F")
      # @date = @choosen_date.strftime("%F")
      @game = search["game"]
      @events = Event.include_address(@location).event_date(@formated_date)
    else
      @events = Event.where.not(latitude: nil, longitude: nil)

    end

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

# .game_name(@game)
