# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def rent
        service = Users::RentBook.call(@current_user, params[:id])

        service.either(
          -> success { render json: BookSerializer.new(success[:book]), status: 200 }, 
          -> failure { render json: { errors: failure[:errors] }, status: 400 }
        )
      end

      def return
        service = Users::ReturnBook.call(@current_user, params[:id])

        service.either(
          -> success { render json: BookSerializer.new(success[:book]), status: 200 }, 
          -> failure { render json: { errors: failure[:errors] }, status: 400 }
        )
      end
    end
  end
end
