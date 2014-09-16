class InterestingrantersController < ApplicationController

  def index
    @interesting_ranters = current_user.interestingranters


  end

  def create
    p "*"
    p params
   @interesting_ranter = Interestingranter.new(
     :user_id => params[:user_id],
     :ranter_id =>params["format"]
   )

  if @interesting_ranter.save!
    flash[:notice] = "Follow was successful"
    redirect_to :back
  else
    redirect_to :back
  end

  end

  def destroy
    Interestingranter.where(:user_id => params[:user_id], :ranter_id => params[:id]).destroy_all
    redirect_to root_path
  end

end