
class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    cookies[:welcome] = {:value => true, :expires => Time.now + 1.months}
  end

  def create

    user = User.find_by(:username => params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      cookies.delete :welcome
      flash[:notice] = "Welcome"
      redirect_to root_path
    else
      flash[:notice] = "Username or password are incorrect"
      render :new
    end
  end

  def delete
    session.clear
    flash[:notice] = "Thank you for visiting"
    redirect_to homepage_path
  end
end