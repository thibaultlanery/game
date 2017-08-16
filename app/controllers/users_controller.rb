class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

end
#ajout dans le schema userpreference user status enum userdescription(txt)
