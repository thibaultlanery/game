class FriendshipsController < ApplicationController

def index

end

def new

end

def create
  @user = User.find(params[:user_id])
  @friendship = current_user.friend_request(@user)
   if @friendship == true
  flash[:notice] = 'invitation envoyée'
  else
  flash[:alert] = 'there is a problem'
  end
  redirect_to user_path(@user)
end

def destroy
  @user = User.find(params[:user_id])
  end_of_friendship = current_user.remove_friend(@user)
  if end_of_friendship
    flash[:notice] = "l'utilisateur ne fait plus parti de vos amis"
   else
  flash[:alert] = 'oups'
  end
  redirect_to user_path(@user)
end


end
