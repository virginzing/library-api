require 'rails_helper'

RSpec.describe Authentication::Logout, type: :service do
  it 'return Success when token is valid' do
    service = Authentication::Logout.call(@current_user, @valid_token)

    expect(service.success?).to eq(true)
  end

  it 'return Failure and errors message UNAUTHORIZED when token is invalid' do
    service = Authentication::Logout.call(@current_user, @INVALID)

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].include?(ErrorsMessage::UNAUTHORIZED)).to eq(true)
  end
end