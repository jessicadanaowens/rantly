require "cgi"
class RantsController < ApplicationController

  def index
    @my_rants = Rant.where(:user_id => session[:user_id])
    @rant = Rant.new
    @user = User.find(session[:user_id])
    @my_rants = Rant.where(:user_id => session[:user_id])
    @latest_rants = Rant.where.not(user_id: session[:user_id])
    @interesting_ranters_ids = Interestingranter.where(:user_id => session[:user_id]).select(:ranter_id).map(&:ranter_id)
    p "*" * 80
    p @interesting_ranters
  end

  def create
    @rant = Rant.new(
      :topic => params[:rant][:topic],
      :rant => params[:rant][:rant],
      :user_id => session[:user_id]
    )

    if @rant.save
      flash[:notice] = "Rant was successfully created"
      redirect_to root_path
    else
      render :new
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