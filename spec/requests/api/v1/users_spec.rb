require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'users api', type: :request do
  path '/api/v1/users' do 
    post 'register user' do 
      tags 'Authentication'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          full_name: { type: :string, example: 'Chris Hemsworth' },
          email: { type: :string, example: 'chris@hems.worth' },
          address: { type: :string, example: '123 Shirley Street PIMPAMA QLD 4209 AUSTRALIA' },
          age: { type: :integer, example: 39 },
          gender: { type: :string, example: 'Male' },
          password: { type: :string, example: 'Thor0dinS*N' },
          favorite_categories: { type: :array, 
            items: {
              type: :string,
            }, example: ['fiction']
          }
        },
        required: [ 'full_name', 'email', 'address', 'age', 'gender', 'password', 'favorite_categories']
      }
      
      response '201', 'user registered' do
        let(:user) {{
          "full_name": "Chris Hemsworth",
          "email": "NEW.chris@hems.worth",
          "address": "123 Shirley Street PIMPAMA QLD 4209 AUSTRALIA",
          "age": 39,
          "gender": "Male",
          "password": "Thor0dinS*N",
          "favorite_categories": ["fiction"]
        }}

        run_test! do |response|
          expect(json["data"]["type"]).to eq("user")
       end
      end

      response '400', 'invalid request' do
        let(:user) {}

        run_test! do |response|
           expect(json['errors'].present?).to eq(true)
        end
      end
    end
  end
end