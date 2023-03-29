require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'authentication api', type: :request do
  path '/api/v1/auth/login' do 
    post 'user login' do 
      tags 'Authentication'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'chris@hems.worth' },
          password: { type: :string, example: 'Thor0dinS*N' }
        },
        required: [ 'email', 'password']
      }
      response '200', 'user login and return X-API-KEY token' do
        let(:login) {{
          "email": "chris@hems.worth",
          "password": "Thor0dinS*N"
        }}

        run_test! do |response|
          expect(json['token'].present?).to eq(true)
       end
      end

      response '401', 'invalid email and/or password' do
        let(:login) {}

        run_test! do |response|
           expect(json['errors'].present?).to eq(true)
        end
      end
    end
  end

  path '/api/v1/auth/logout' do 
    delete 'user logout' do 
      tags 'Authentication'
      produces 'application/json'
      consumes 'application/json'
      parameter name: 'X-API-KEY', in: :header, type: :string, example: 'Bearer X-API-KEY'

      response '200', 'user logout' do
        let('X-API-KEY') { "Bearer #{@valid_token}" }

        run_test! 
      end

      response '401', 'invalid token' do
        let('X-API-KEY') {}

        run_test! do |response|
           expect(json['errors'].present?).to eq(true)
        end
      end
    end
  end
end