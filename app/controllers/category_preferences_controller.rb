class CategoryPreferencesController < ApplicationController

  def create
    @user = current_user
    category_ids = params[:category_preferences][:category_preferences][:category]
    current_user.category_preferences << category_ids.map { |category_id| CategoryPreference.new(category_id: category_id) }

    current_user.category_preferences.each do |category_preference|
      if category_preference.save
      flash[:notice] = 'thanks'
      else
      flash[:alert] = 'you already choose this category'

      end
    end
  redirect_to user_path(@user)

  end

  def destroy
    @user = current_user
    @category_preference = CategoryPreference.find(params[:id])
    @category_preference.destroy
  redirect_to user_path(@user)
  end


def category_preference_params
   params.require(:category_preference).permit(:user, :category)
 end

end
