class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
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