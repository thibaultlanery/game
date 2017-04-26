class EventsController < ApplicationController

  def index

    if params[:search]
      if params[:search][:address].present?
      @location = params["address"]
      @events = Event.include_address(@location)
      # elsif params[:search][:address].present? && params[:search][:game].present?
      # @location = params["address"]
      # @events = Event.include_address(@location)
      # @game = params["game"]
      # @events = Event.game_name(@game).include_address(@location)
      end
    elsif params[:search].present? && params[:search][:address].present? && params[:search][:date].present?  && params[:search][:game].present?
      @location = params["address"]
      # @choosen_date = Date.new search["happen_at(1i)"].to_i, search["happen_at(2i)"].to_i, search["happen_at(3i)"].to_i
      # @date = @choosen_date.strftime("%F")
      @date = Date.parse(params["date"])
      @formated_date = @date.strftime("%F")
      @game = params["game"]
      @events = Event.include_address(@location).event_date(@formated_date).game_name(@game)
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

def create
  #ne pas oublier de formater les dates et les noms de villes en capitalise
end

end


