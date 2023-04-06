require 'rails_helper'

RSpec.describe Authentication::CurrentUser, type: :service do
  it 'return Success and user when token is valid' do
    service = Authentication::CurrentUser.call(@valid_token)

    expect(service.success?).to eq(true)
    expect(service.value![:user]).to eq(@current_user)
  end

  it 'return Failure and errors message TOKEN_IS_INVALID when token is invalid' do
    service = Authentication::CurrentUser.call(@INVALID)

    expect(service.failure?).to eq(true)
  end
end