module Authentication
  class CurrentUser < ApplicationService
    param :token, type: proc(&:to_s)

    def call
      decoded = Authentication::Token.jwt_decode(token)
  
      user = User.find_by_id(decoded[:user_id])

      return Failure(errors: [ErrorsMessage::TOKEN_IS_INVALID]) unless user
      return Failure(errors: [ErrorsMessage::TOKEN_IS_INVALID]) unless user.sessions.include?(@token)
        
      Success(user: user)
    end
  end
end