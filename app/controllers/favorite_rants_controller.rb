class FavoriteRantsController < ApplicationController

  def index
    @rant = Rant.new
    @favorite_rants = current_user.favorite_rants
  end

  def create
    @favorite_rant = FavoriteRant.new(
      :user_id => current_user.id,
      :rant_id => params[:id]
    )

    if @favorite_rant.save!
      flash[:notice]= "Rant was successfully favorited"
      respond_to do |format|
        format.json { render :json => {}}
      end
    else
      raise "error"
    end
  end

  def destroy
    FavoriteRant.where(:rant_id => params[:id], :user_id => (current_user.id)).destroy_all
    respond_to do |format|
      format.json { render :json => {}}
    end
  end
end