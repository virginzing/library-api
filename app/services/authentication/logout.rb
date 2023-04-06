module Authentication
  class Logout < ApplicationService
    def initialize(current_user, token)
      @current_user = current_user
      @token = token
    end

    def call
      decoded = Authentication::Token.jwt_decode(@token)

      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless @current_user.id == decoded[:user_id]
      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless @current_user.update_columns(sessions: @current_user.sessions - [@token])
        
      Success()
    end
  end
end