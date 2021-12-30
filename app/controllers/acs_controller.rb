class AcsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @acs = Ac.all
  end

  def show
    @ac = Ac.find(params[:id]); p @ac
  end

  def show_by_sn
    @ac = Ac.find_by(serial_number: params[:serial_number])

    if ! @ac
      flash[:notice] = "Can not find the ac with #{params[:serial_number]}"
    end
  end

end
