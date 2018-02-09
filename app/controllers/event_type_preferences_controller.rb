class EventTypePreferencesController < ApplicationController

    def create
    @user = current_user
    event_type_ids = params[:event_type_preferences][:event_type_preferences][:event_type]
    current_user.event_type_preferences << event_type_ids.map { |event_type_id| EventTypePreference.new(event_type_id: event_type_id) }

    current_user.event_type_preferences.each do |event_type_preference|
      if event_type_preference.save
      flash[:notice] = 'thanks'
      else
      flash[:alert] = 'you already choose this category'

      end
    end
  redirect_to user_path(@user)

  end


  def destroy
    @user = current_user
    @event_type_preference = EventTypePreference.find(params[:id])
    @event_type_preference.destroy
  redirect_to user_path(@user)
  end

end
