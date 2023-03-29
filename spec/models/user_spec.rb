require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @valid_user = User.new(@new_user_params)
  end

  it 'user :full_name must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.full_name = nil
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :email must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.email = nil
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :email must be valid format.' do
    @valid_user.email = @INVALID
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :email must be downcase when save' do
    @valid_user.save
    expect(@valid_user.email).to eq(@new_user_params[:email].downcase)
  end

  it 'user :address must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.address = nil
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :age must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.age = nil
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :gender must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.gender = nil
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :gender must be allow list in User::GENDER.' do
    @valid_user.gender = @INVALID
    expect(@valid_user.valid?).to eq(false)
  end

  it 'user :password must presence.' do
    expect(@valid_user.valid?).to eq(true)

    @valid_user.password = nil
    expect(@valid_user.valid?).to eq(false)
  end
end
