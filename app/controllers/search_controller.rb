class SearchController < ApplicationController

  def new
    @new_rant = Rant.new
    @users = User.search(params[:search])
  end

end