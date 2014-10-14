class FavoriteRantsController < ApplicationController

  def index
    @rant = Rant.new
    @favorite_rants = current_user.favorite_rants
    @interesting_ranters_ids = InterestingRanterLocator.new(current_user).interesting_ranters_ids
  end

  def create
    @favorite_rant = FavoriteRant.new(
      :user_id => params[:user_id],
      :rant_id => params[:format]
    )

    if @favorite_rant.save!
      flash[:notice]= "Rant was successfully favorited"
      redirect_to  user_rant_path(params[:user_id], params[:format])
    else
      redirect_to  user_rant_path(params[:user_id], params[:format])
    end
  end

  def destroy
    FavoriteRant.where(:rant_id => params[:id], :user_id => params[:user_id]).destroy_all
    redirect_to user_rant_path(params[:user_id], params[:id])
  end
end