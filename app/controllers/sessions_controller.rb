class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    cookies[:welcome] = {:value => true, :expires => Time.now + 1.months}
  end

  def create
    user = User.find_by(:username => params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.email_is_confirmed?
        session[:user_id] = user.id
        cookies.delete :welcome
        flash[:notice] = "Welcome"
        redirect_to root_path
      else
        flash[:notice] = "You must confirm your email prior to logging in.  Please see your confirmation email and follow the instructions."
        render :new
      end
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