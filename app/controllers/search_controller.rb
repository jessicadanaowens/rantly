class SearchController < ApplicationController

  def new
    @rant = Rant.new
    @users = User.search(params[:search])
    @interesting_ranters_ids = InterestingRanterLocator.new(current_user).interesting_ranters_ids
  end

end