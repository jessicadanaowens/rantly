require "cgi"

class RantsController < ApplicationController

  def index
    @rant = Rant.new
    latest_rants
    mentioned_rants
  end

  def create
    @rant = Rant.new
    latest_rants

    @rant = Rant.new(
      :topic => params[:topic],
      :rant => params[:rant],
      :user_id => current_user.id
    )

    if @rant.save
      flash[:notice] = "Rant was successfully created"
      respond_to do |format|
        format.json { render :json => {}}
      end
    else
      errors = @rant.errors.messages
      render :json => {errors: errors}
    end
  end

  def destroy
    Rant.find(params[:id]).destroy
    flash[:notice] = "Rant was deleted successfully!"
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @rant = Rant.new
    @show_rant = Rant.find(params[:id])
  end

  private

  def allow_params
    params.require(:rant).permit(:topic, :rant, :user_id => session[:user_id])
  end

  def latest_rants
    @latest_rants ||= Rant.where.not(user_id: session[:user_id])
  end

  def mentioned_rants
    @mentioned_rants ||= Rant.where('rant LIKE ?', "%@#{current_user.username}%")
  end

end