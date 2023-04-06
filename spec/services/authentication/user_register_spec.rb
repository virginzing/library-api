require 'rails_helper'

RSpec.describe Authentication::UserRegister, type: :service do
  it 'return Success then create User and UserFavoriteCategory given data when all params is valid' do
    categories = Book::CATEGORIES.sample(3)
    user_params = { 
      full_name: 'Chris Hemsworth',
      email: 'NEW.chris@hems.worth',
      address: '123 Shirley Street PIMPAMA QLD 4209 AUSTRALIA',
      age: 39,
      gender: 'Male',
      password: 'Thor0dinS*N',
      favorite_categories: categories 
    }
    
    service = Authentication::UserRegister.call(
      user_params[:email], 
      user_params[:full_name],
      user_params[:age],  
      user_params[:address], 
      user_params[:gender], 
      user_params[:password],
      user_params[:favorite_categories]
    )

    expect(service.success?).to eq(true)

    created_user = service.value![:user]
    created_user_data = created_user.as_json

    expect(created_user_data['full_name']).to eq(user_params[:full_name])
    expect(created_user_data['email']).to eq(user_params[:email].downcase)
    expect(created_user_data['address']).to eq(user_params[:address])
    expect(created_user_data['age']).to eq(user_params[:age])
    expect(created_user_data['gender']).to eq(user_params[:gender])
    expect(UserFavoriteCategory.where(user: created_user, category: categories).map(&:category)).to eq(categories)
  end

  it 'return Failure and errors message when any params is invalid' do
    service = Authentication::UserRegister.call(
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    )

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].present?).to eq(true)
  end
end