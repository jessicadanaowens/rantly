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

  def destroy
    p "*" * 80
    p params
    Interestingranter.where(:user_id => params[:user_id], :ranter_id => params[:id]).destroy_all
    redirect_to root_path
  end

end