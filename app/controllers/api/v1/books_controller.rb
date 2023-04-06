# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def rent
        service = Users::RentBook.call(@current_user, params[:id])

        if service[:success]
          render json: BookSerializer.new(service[:book]), status: 200
        else
          render json: { errors: service[:errors] }, status: 400
        end
      end

      def return
        service = Users::ReturnBook.call(@current_user, params[:id])

        if service[:success]
          render json: BookSerializer.new(service[:book]), status: 200
        else
          render json: { errors: service[:errors] }, status: 400
        end
      end
    end
  end
end
