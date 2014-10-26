class InterestingRantersController < ApplicationController

  def index
    @interesting_ranters = current_user.interesting_ranters
    @rant = Rant.new
  end

  def create
   @interesting_ranter = InterestingRanter.new(
     :user_id => current_user.id,
     :ranter_id =>params[:id]
   )

    if @interesting_ranter.save!
      flash[:notice] = "Follow was successful"
      respond_to do |format|
        format.json { render :json => {}}
      end
    else
      raise "error"
    end
  end

  def destroy
    InterestingRanter.where(:user_id => current_user.id, :ranter_id => params[:id]).destroy_all
    respond_to do |format|
      format.json { render :json => {}}
    end
  end

end