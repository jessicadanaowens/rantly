class SearchController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @users = User.search(params[:search])
    @interesting_ranters_ids = InterestingRanter.where(:user_id => session[:user_id]).select(:ranter_id).map(&:ranter_id)
  end

end