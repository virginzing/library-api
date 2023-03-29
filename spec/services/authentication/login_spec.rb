require 'rails_helper'

RSpec.describe Authentication::Login, type: :service do
  it 'return success and token when email and password is valid' do
    service = Authentication::Login.call(@valid_email, @valid_password)

    expect(service[:success]).to eq(true)
    expect(service[:token].present?).to eq(true)
  end

  it 'return fail and errors message UNAUTHORIZED when email and/or password is invalid' do
    invalid_email_service = Authentication::Login.call(@INVALID, @valid_password)

    expect(invalid_email_service[:success]).to eq(false)
    expect(invalid_email_service[:errors].include?(ErrorsMessage::UNAUTHORIZED)).to eq(true)
  
    invalid_password_service = Authentication::Login.call(@valid_email, @INVALID)

    expect(invalid_email_service[:success]).to eq(false)
    expect(invalid_email_service[:errors].include?(ErrorsMessage::UNAUTHORIZED)).to eq(true)
  
    invalid_email_password_service = Authentication::Login.call(@INVALID, @INVALID)

    expect(invalid_email_service[:success]).to eq(false)
    expect(invalid_email_service[:errors].include?(ErrorsMessage::UNAUTHORIZED)).to eq(true)
  end
end