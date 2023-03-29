# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request

      def register
        service = Authentication::UserRegister.call(
          params.slice(:email, :full_name, :age, :address, :gender, :password, :favorite_categories)
        )

        if service[:success]
          render status: 201
        else
          render json: { errors: service[:errors] }, status: 400
        end
      end
    end
  end
end
