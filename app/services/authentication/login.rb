module Authentication
  class Login < ApplicationService
    def initialize(email, password)
      @email = email&.downcase
      @password = password
    end

    def call
      user = User.find_by_email(@email)

      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless user&.authenticate(@password)
        
      token = Authentication::Token.jwt_encode(user_id: user.id)
      user.update_columns(sessions: user.sessions.concat([token]))

      Success(token: token)
    end
  end
end