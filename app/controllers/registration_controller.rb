class RegistrationController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @user = User.new
  end

  def create
    if User.find_by(email: user_params[:email])
      render :new, alert: 'Please choose a new user email instead.'
    else
      random_password = SecureRandom.hex(10)
      @user = User.new(email: user_params, password: random_password, password_confirmation: random_password)

      if @user.save
        RegistrationMailer.with(user: @user).invite.deliver_later
        redirect_to root_path, notice: 'An email has been sent to user email.'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
