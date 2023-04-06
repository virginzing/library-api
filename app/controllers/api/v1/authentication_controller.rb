# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request, only: [:login]

      def login
        service = Authentication::Login.call(params[:email], params[:password])

        service.either(
          -> success { render json: { token: success[:token] }, status: 200 }, 
          -> failure { render json: { errors: failure[:errors] }, status: 401 }
        )
      end

      def logout
        service = Authentication::Logout.call(@current_user, @token)

        service.either(
          -> success { render status: 200 }, 
          -> failure { render status: 401 }
        )
      end
    end
  end
end
