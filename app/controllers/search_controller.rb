class SearchController < ApplicationController

  def new
    @rant = Rant.new
    users = []
    users << User.search_last_name(params[:search]) if User.search_last_name(params[:search]) != []
    users << User.search_first_name(params[:search]) if User.search_first_name(params[:search]) != []
    users << User.search_username(params[:search]) if User.search_username(params[:search]) != []
    @users = users.flatten.uniq

    rants = []
    rants << Rant.search_topic(params[:search]) if Rant.search_topic(params[:search]) != []
    rants << Rant.search_rant(params[:search]) if Rant.search_rant(params[:search]) != []
    @rants = rants.flatten.uniq
  end

end