require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'books api', type: :request do
  path '/api/v1/books/{id}/rent' do 
    post 'user rent book :id' do 
      tags 'Books'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, example: 42
      parameter name: 'X-API-KEY', in: :header, type: :string, example: 'Bearer X-API-KEY'

      response '200', 'user rent book success and return rented books' do
        let(:id) { @availiable_book.id }
        let('X-API-KEY') { "Bearer #{@valid_token}" }

        run_test! do |response|
          expect(json['rented_books'].present?).to eq(true)
       end
      end

      response '400', 'fail with errors message' do
        let(:id) { @INVALID }
        let('X-API-KEY') { "Bearer #{@valid_token}" }

        run_test! do |response|
           expect(json['errors'].present?).to eq(true)
        end
      end
    end
  end

  path '/api/v1/books/{id}/return' do 
    post 'user return book :id' do 
      tags 'Books'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, example: 42
      parameter name: 'X-API-KEY', in: :header, type: :string, example: 'Bearer X-API-KEY'

      response '200', 'user return book success and return rented books' do
        let(:id) { @rented_book.id }
        let('X-API-KEY') { "Bearer #{@valid_token}" }

        run_test! do |response|
          expect(json.has_key?('rented_books')).to eq(true)
       end
      end

      response '400', 'fail with errors message' do
        let(:id) { @INVALID }
        let('X-API-KEY') { "Bearer #{@valid_token}" }

        run_test! do |response|
           expect(json['errors'].present?).to eq(true)
        end
      end
    end
  end
end