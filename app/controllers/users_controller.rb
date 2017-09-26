class UsersController < ApplicationController

  def show
    @user = current_user
    @category_preferences = current_user.category_preferences

  end

end
#ajout dans le schema userpreference user status enum userdescription(txt)
