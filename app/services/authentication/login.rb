module Authentication
  class Login < ApplicationService
    param :email, type: proc(&:to_s)
    param :password, type: proc(&:to_s)

    def call
      user = User.find_by_email(email&.downcase)

      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless user&.authenticate(password)
        
      token = Authentication::Token.jwt_encode(user_id: user.id)
      user.update_columns(sessions: user.sessions.concat([token]))

      Success(token: token)
    end
  end
end