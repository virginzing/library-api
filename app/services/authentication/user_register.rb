module Authentication
  class UserRegister < ApplicationService
    param :email, type: proc(&:to_s)
    param :full_name, type: proc(&:to_s)
    param :age, type: proc(&:to_i)
    param :address, type: proc(&:to_s)
    param :gender, type: proc(&:to_s)
    param :password, type: proc(&:to_s)
    param :favorite_categories, type: [proc(&:to_s)]

    def call
      user = User.new(
        email: email, 
        full_name: full_name, 
        age: age, 
        address: address, 
        gender: gender, 
        password: password
      )

      return Failure(errors: user.errors) unless user.save
        
      Users::AddFavoriteCategories.call(user, favorite_categories)
      RegistrationMailer.with(user: user).welcome_email.deliver_now

      Success(user: user)
    end
  end
end