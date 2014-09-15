class InterestingrantersController < ApplicationController


  def create
    p "*"
    p params

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

end