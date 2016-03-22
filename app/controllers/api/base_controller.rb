module Api
  class BaseController < ActionController::Base

    private

    def check_authentication
      respond_with_unauthorized unless matching_key?
    end

    def respond_with_unauthorized
      unauthorized_body = {
        status: "unauthorized",
        message: "authentication failed, please check your secret key."
      }
      render json: unauthorized_body.to_json, status: 500
    end

    def matching_key?
      ActiveSupport::SecurityUtils.secure_compare(
        request.headers['Authorization'],
        ENV.fetch('WANDER_AUTH_TOKEN')
      )
    end

    # def set_default_response
    #   request.format = :json
    # end

  end
end
