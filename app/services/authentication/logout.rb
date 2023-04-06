module Authentication
  class Logout < ApplicationService
    param :current_user
    param :token, type: proc(&:to_s)

    def call
      decoded = Authentication::Token.jwt_decode(token)

      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless current_user.id == decoded[:user_id]
      return Failure(errors: [ErrorsMessage::UNAUTHORIZED]) unless current_user.update_columns(sessions: current_user.sessions - [token])
        
      Success()
    end
  end
end