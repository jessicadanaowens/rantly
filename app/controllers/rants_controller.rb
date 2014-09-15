require "cgi"
class RantsController < ApplicationController

  def new
    @rant = Rant.new
    @user = User.find(session[:user_id])
    @my_rants = Rant.where(:user_id => session[:user_id])
    @latest_rants = Rant.where.not(user_id: session[:user_id])
    @interesting_ranters = Interestingranter.where(:user_id => session[:user_id]).select(:ranter_id).map(&:ranter_id)
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

  def show
    @my_rants = Rant.where(:user_id => session[:user_id])
  end

  def destroy

    Rant.find(params[:id]).destroy
    flash[:notice] = "Rant was deleted successfully!"
    redirect_to root_path
  end

  private

  def allow_params
    params.require(:rant).permit(:topic, :rant, :user_id => session[:user_id])
  end
end