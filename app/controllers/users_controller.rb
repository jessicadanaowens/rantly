require 'pry-byebug'
class UsersController < ApplicationController
  skip_before_action :ensure_current_user, only: [:new, :create]

  def new
    cookies[:welcome] = {:value => true, :expires => Time.now + 1.months}
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # UserMailer.welcome_email(@user).deliver
        cookies.delete :welcome

        format.html { redirect_to(root_path, notice: 'Thank you for registering.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    find_user
  end

  def update
    find_user

    if @user.update(user_params)
      flash[:notice] = "Your profile was updated successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.new
    @rant = Rant.new
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :avatar, :email)
  end

  def find_user
    @user ||= User.find(params[:id])
  end
end