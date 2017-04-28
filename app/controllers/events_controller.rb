class EventsController < ApplicationController

  def index
      search = params[:search]
      if search.present?
          if search["game"].present? && search["address"].present? && search["date"].present?
            @location = search["address"]
            @game = search["game"]
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.game_name(@game.capitalize).event_date(@formated_date).include_address(@location)
          elsif search["address"].present? && search["game"].present?
            @location = search["address"]
            @game = search["game"]
            @events = Event.game_name(@game.capitalize).include_address(@location)
          elsif search["address"].present? && search["date"].present?
            @location = search["address"]
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.include_address(@location).event_date(@formated_date)
          elsif search["game"].present? && search["date"].present?
            @location = current_user.address
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @game = search["game"]
            @events = Event.include_address(@location).event_date(@formated_date).game_name(@game.capitalize)
          elsif search["date"].present?
            @location = current_user.address
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.include_address(@location).event_date(@formated_date)
          elsif search["game"].present?
            @location = current_user.address
            @game = search["game"]
            @events = Event.include_address(@location).game_name(@game.capitalize)
          else search["address"].present?
            @location = search["address"]
            @events = Event.include_address(@location)
          end
      else
        # @events = Event.where.not(latitude: nil, longitude: nil)
        @location = current_user.address
        @events = Event.include_address(@location)
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

  def create
    #ne pas oublier de formater les dates et les noms de villes en capitalise
  end

end


