class UsersController < ApplicationController
  skip_before_action :ensure_current_user, only: [:new, :create]

  def new
    cookies[:welcome] = {:value => true, :expires => Time.now + 1.months}
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      cookies.delete :welcome

      flash[:notice] = "Thank you for registering #{@user.username}!"
      UserMailer.registration(@user).deliver
      UserMailer.confirmation(@user).deliver
      redirect_to root_path
    else
      render :new
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

  def confirm
    email_confirmer = EmailConfirmer.find_by(confirmation_token: params[:confirmation_token])
    if email_confirmer
      User.find(email_confirmer.user_id).update_attribute(:confirmed, true)
      email_confirmer.destroy
      flash[:notice] = "Email confirmed. You can now log in."
      redirect_to signin_path
    else
      flash[:notice] = "Email confirmation is invalid"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :avatar, :email)
  end

  def find_user
    @user ||= User.find(params[:id])
  end
end