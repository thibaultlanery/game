class EventTypePreferencesController < ApplicationController

def create
  @user = current_user
  if params[:id]
    @event_type_preference = EventTypePreference.new(event_type_params)
    # @event_type = EventType.new(name: params[:event_type_preference][:event_type_name])
    # @event_type_preference.event_type = @event_type
    @event_type_preference.user = @user
      if @event_type_preference.save
            respond_to do |format|
          format.html {   redirect_to user_path(@user) }
          format.js {} # <-- will render `app/views/reviews/create.js.erb`
          end
      else
            respond_to do |format|
          format.html { render 'user/show' }
          format.js {} # <-- idem
          end
      end
  else
    event_type_ids = params[:event_type_preferences][:event_type_preferences][:event_type]
    current_user.event_type_preferences << event_type_ids.map { |event_type_id| EventTypePreference.new(event_type_id: event_type_id) }
    current_user.event_type_preferences.each do |event_type_preference|
      if event_type_preference.save
          respond_to do |format|
        format.html {   redirect_to user_path(@user)}
        format.js {} # <-- will render `app/views/reviews/create.js.erb`
        end
      else
           respond_to do |format|
        format.html { render 'user/show' }
        format.js {} # <-- idem
        end
      end
    end
  end
end


  def destroy
    @user = current_user
    @event_type_preference = EventTypePreference.find(params[:id])
    if @event_type_preference.destroy
      respond_to do |format|
      format.html { redirect_to user_path(@user)}
      format.js {} # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
      format.html { render 'user/show' }
      format.js {} # <-- idem
      end
    end
  end

  def event_type_params
   params.require(:event_type_preference).permit(:name, :category, :event_type_name)
  end

end
