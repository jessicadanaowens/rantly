class InterestingRantersController < ApplicationController

  def index
    @interesting_ranters = current_user.interesting_ranters
    @rant = Rant.new
  end

  def create
   @interesting_ranter = InterestingRanter.new(
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
    InterestingRanter.where(:user_id => params[:user_id], :ranter_id => params[:id]).destroy_all
    redirect_to root_path
  end

end