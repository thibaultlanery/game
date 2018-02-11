class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @category_preferences = current_user.category_preferences
    @event_type_preferences = current_user.event_type_preferences
  end

end
#ajout dans le schema userpreference user status enum userdescription(txt)
