class UsersController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @users = User.all
  end

  def update
    @user = User.find_by(id: user_params[:id])

    if @user.present? \
        && Current.user.id != @user.id \
        && @user.update(user_params)
      redirect_to users_url, notice: "User #{@user.email} status has been updated"
    else
      redirect_to users_url, alert: "Can not update user #{@user.email} status"
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:id, :active)
  end
end
