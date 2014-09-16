class InterestingrantersController < ApplicationController

  def index
    @interesting_ranters_ids = Interestingranter.where(:user_id => params[:user_id]).select(:ranter_id).map(&:ranter_id)
    @interesting_ranters = []
    @interesting_ranters_ids.each do |id|
      @interesting_ranters << User.find(id)
    end
    p "*" * 80
    p @interesting_ranters


  end

  def create
   @interesting_ranter = Interestingranter.new(
     :user_id => session[:user_id],
     :ranter_id =>params["format"]
   )

  if @interesting_ranter.save
    flash[:notice] = "Follow was successful"
    redirect_to root_path
  else
    redirect_to root_path
  end

  end

  def destroy
    Interestingranter.where(:user_id => params[:user_id], :ranter_id => params[:id]).destroy_all
    redirect_to root_path
  end

end