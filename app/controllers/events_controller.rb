class EventsController < ApplicationController

  def index
      search = params[:search]
      if search.present?
          if search["event_type"].empty? && search["address"].empty? && search["date"].empty?
            @location = current_user.address
            @events = Event.include_address(@location).exclude_user(current_user)
          elsif search["game"].present? && search["address"].present? && search["date"].present?
            @location = search["address"]
            @game = search["event_type"]
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.game_name(@game.capitalize).event_date(@formated_date).include_address(@location).exclude_user(current_user)
          elsif search["address"].present? && search["event_type"].present?
            @location = search["address"]
            @game = search["event_type"]
            @events = Event.game_name(@game.capitalize).include_address(@location).exclude_user(current_user)
          elsif search["address"].present? && search["date"].present?
            @location = search["address"]
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.include_address(@location).event_date(@formated_date).exclude_user(current_user)
          elsif search["event_type"].present? && search["date"].present?
            @location = current_user.address
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @game = search["event_type"]
            @events = Event.include_address(@location).event_date(@formated_date).game_name(@game.capitalize).exclude_user(current_user)
          elsif search["date"].present?
            @location = current_user.address
            @date = Date.parse(search["date"])
            @formated_date = @date.strftime("%F")
            @events = Event.include_address(@location).event_date(@formated_date).exclude_user(current_user)
          elsif search["event_type"].present?
            @location = current_user.address
            @game = search["event_type"]
            @events = Event.include_address(@location).game_name(@game).exclude_user(current_user)
          else search["address"].present?
            @location = search["address"]
            @events = Event.include_address(@location).exclude_user(current_user)
          end
      else
        # @events = Event.where.not(latitude: nil, longitude: nil)
        @location = current_user.address
        @events = Event.include_address(@location).exclude_user(current_user)
      end
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def show
    @event = Event.find(params[:id])
    @participation =  current_user.participations.where({event: @event}).first
    @no_participation_yet = current_user.participations.where({event: @event}).first == nil
    @participation_demand = current_user.participations.where(status: :interested, event: @event).first
    @count_of_interested = @event.participations.where(status: "interested").count
    @count_of_confirmed = @event.participations.where(status: "confirmed").count
  end

  def new
    @event = Event.new
    @event_type_pickeds = @event.event_type_pickeds.build
    # @event_types = EventType.all.map { |event_type| {id: event_type.id, text: event_type.name} }
    @event_types = EventType.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
  
    event_types = params[:event][:event_type_pickeds][:event_type_names].reject(&:blank?)
    event_types.map! { |event_type_name| { event_type_id: EventType.find_or_create_by(name: event_type_name).id } }
    @event.event_type_pickeds.build(event_types)

    # event_types.each { |event_type| @event.event_type_pickeds.build(event_type_id: event_type.id) }

    # @event.event_type_pickeds = event_type_ids.map { |event_type_id| EventTypePicked.new(event_type_id: event_type_id) }
    # event_type_ids = params[:event][:event_type_pickeds][:event_type_ids]
    # @event.event_type_pickeds << event_type_ids.map { |event_type_id| EventTypePicked.new(event_type_id: event_type_id) }

    if @event.save
      redirect_to event_path(@event),  notice: "Event created! Here is your recap :)"
    else
      render :new , alert: "Ooooops, something missing! Please try again"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end


  def update
  @event = Event.find(params[:id])
  @event.update(event_params)
  if @event.save
      redirect_to event_path(@event), notice: "Event updated"
      else
      redirect_to event_path(@event), alert: "something went wrong"
      end
  end

  def destroy
   @event = Event.find(params[:id])
    @event.canceled_at = Date.today
      if @event.save
      redirect_to event_path(@event), notice: "Event cancelled"
      else
      redirect_to event_path(@event), alert: "something went wrong"
      end
  end


  def myevents
    @events = current_user.events.where(canceled_at: nil)
    @cancelled_events = current_user.events.where.not(canceled_at: nil)
    @participations_confirmed = current_user.participations.where(status: :confirmed)
    @participation_demand = current_user.participations.where(status: :interested) #pending
    @participations_loc = current_user.participations.map do |participation, event| participation.event end
    @coordonates = @events + @participations_loc
    @hash = Gmaps4rails.build_markers(@coordonates) do |coordonate, marker|
    marker.lat coordonate.latitude
    marker.lng coordonate.longitude
    marker.title coordonate.title
    end
  end


  def event_params
   params.require(:event).permit(:title, :description, :happen_at, :participant_number, :canceled_at, :address, photos: [])
   #,event_type_pickeds_attributes: [:event_type_id]
  end





end
