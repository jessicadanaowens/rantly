require "pry-byebug"
class FavoriteRantsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @favorite_rants = @user.favorite_rants
    @interesting_ranters_ids = Interestingranter.where(:user_id => session[:user_id]).select(:ranter_id).map(&:ranter_id)

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