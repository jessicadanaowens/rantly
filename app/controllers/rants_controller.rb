require "cgi"

class RantsController < ApplicationController

  def index
    @rant = Rant.new
    @my_rants = Rant.where(:user_id => session[:user_id])
    @latest_rants = Rant.where.not(user_id: session[:user_id])
    @interesting_ranters_ids = InterestingRanterLocator.new(current_user).interesting_ranters_ids
  end

  def create
    @rant = Rant.new
    @my_rants = Rant.where(:user_id => session[:user_id])
    @latest_rants = Rant.where.not(user_id: session[:user_id])
    @interesting_ranters_ids = InterestingRanterLocator.new(current_user).interesting_ranters_ids

    @rant = Rant.new(
      :topic => params[:rant][:topic],
      :rant => params[:rant][:rant],
      :user_id => session[:user_id]
    )

    if @rant.save
      flash[:notice] = "Rant was successfully created"
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    Rant.find(params[:id]).destroy
    flash[:notice] = "Rant was deleted successfully!"
    redirect_to root_path
  end

  def show
    @favorite_rants_ids = FavoriteRant.where(:user_id => params[:user_id]).select(:rant_id).map(&:rant_id)
    @rant = Rant.find(params[:id])
  end

  private

  def allow_params
    params.require(:rant).permit(:topic, :rant, :user_id => session[:user_id])
  end

end