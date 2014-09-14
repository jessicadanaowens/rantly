class RantsController < ApplicationController

  def new
    @rant = Rant.new
    @user = User.find(session[:user_id])
    @my_rants = Rant.where(:user_id => session[:user_id])
  end

  def create
    @rant = Rant.new(
      :topic => params[:rant][:topic],
      :rant => params[:rant][:rant],
      :user_id => session[:user_id]
    )

    if @rant.save
      flash[:notice] = "Rant was successfully created"
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def allow_params
    params.require(:rant).permit(:topic, :rant, :user_id => session[:user_id])
  end


end