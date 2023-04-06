module Authentication
  class UserRegister < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      user = User.new(
        email: @params[:email], 
        full_name: @params[:full_name], 
        age: @params[:age], 
        address: @params[:address], 
        gender: @params[:gender], 
        password: @params[:password]
      )

      return { success: false, errors: user.errors } unless user.save
        
      Users::AddFavoriteCategories.call(user, @params[:favorite_categories])
      RegistrationMailer.with(user: user).welcome_email.deliver_now

      { success: true, user: user }
    end
  end
end