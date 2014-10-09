class UsersController < ApplicationController
  skip_before_action :ensure_current_user, only: [:new, :create]

  def new
    cookies[:welcome] = {:value => true, :expires => Time.now + 1.months}
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thank you for registering!"
      cookies.delete :welcome
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

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
    @favorite_rants_ids = FavoriteRant.where(:user_id => params[:user_id]).select(:rant_id).map(&:rant_id)
    @interesting_ranters_ids = InterestingRanterLocator.new(current_user).interesting_ranters_ids
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency)
  end
end