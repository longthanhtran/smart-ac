module Api
  class AcStatusesController < ApiController
    before_action :header_check, only: [:create]

    BATCH_LIMIT = 500

    def create
      if ac_sensor_status_params_store?
        head :accepted
      else
        head :unprocessable_entity
      end
    end

    private

    def ac_sensor_status_params_store?
      ac_status_param = params.require(:ac_status)
      return store_statuses to_hash(ac_status_param) if ac_status_param.is_a? Array
      return store_status get_status(ac_status_param)
      false
    end

    def store_statuses(statuses)
      AcSensorStatus.insert_all(statuses) unless statuses.count > BATCH_LIMIT
    end

    def store_status(status)
      AcSensorStatus.new(status).save
    end

    def to_hash(params_statuses)
      params_statuses.map {|status| get_status(status)}
    end

    def get_status(status)
      status.permit(:temperature, :serial_number, :humidity, :co_level, :health_status)
    end
  end
end
