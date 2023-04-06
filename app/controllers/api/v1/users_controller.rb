# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request

      def register
        service = Authentication::UserRegister.call(
          params[:email], 
          params[:full_name], 
          params[:age], 
          params[:address], 
          params[:gender], 
          params[:password], 
          params[:favorite_categories]
        )

        service.either(
          -> success { render json: UserSerializer.new(success[:user]), status: 201 }, 
          -> failure { render json: { errors: failure[:errors] }, status: 400 }
        )
      end
    end
  end
end
