module Api
  class ApiController < ActionController::API

  private

    def header_check
      head :forbidden unless Ac.find_by(serial_number: x_serial)
    end

    def x_serial
      request.headers["X-Serial"]
    end
  end
end
