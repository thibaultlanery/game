class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @category_preferences = current_user.category_preferences

  end

end
#ajout dans le schema userpreference user status enum userdescription(txt)
