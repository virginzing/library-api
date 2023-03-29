# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request, only: [:login]

      def login
        service = Authentication::Login.call(params[:email], params[:password])

        if service[:success]
          render json: { token: service[:token] }, status: 200
        else
          render json: { errors: service[:errors] }, status: 401
        end
      end

      def logout
        service = Authentication::Logout.call(@current_user, @token)

        if service[:success]
          render status: 200
        else
          render status: 401
        end
      end
    end
  end
end
