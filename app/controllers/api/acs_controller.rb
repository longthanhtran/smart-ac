module Api
  class AcsController < ApiController
    def index
      @acs = Ac.all
      render json: @acs
    end

    def show
      render json: Ac.find_by(serial_number: params[:id])
    end

    def create
      @ac = Ac.new(ac_params)
      if @ac.save
        render json: @ac, status: :created
      else
        render json: @ac.errors, status: :unprocessable_entity
      end
    end

    private

    def ac_params
      params.require(:ac)
        .permit(:serial_number, :registration_date, :firmware_version)
    end
  end
end
