require 'rails_helper'

RSpec.describe Authentication::CurrentUser, type: :service do
  it 'return success and user when token is valid' do
    service = Authentication::CurrentUser.call(@valid_token)

    expect(service[:success]).to eq(true)
    expect(service[:user]).to eq(@current_user)
  end

  it 'return fail and errors message TOKEN_IS_INVALID when token is invalid' do
    service = Authentication::CurrentUser.call(@INVALID)

    expect(service[:success]).to eq(false)
  end
end