module Authentication
  class Logout < ApplicationService
    def initialize(current_user, token)
      @current_user = current_user
      @token = token
    end

    def call
      decoded = Authentication::Token.jwt_decode(@token)

      return { success: false, errors: [ErrorsMessage::UNAUTHORIZED] } unless @current_user.id == decoded[:user_id]
      return { success: false, errors: [ErrorsMessage::UNAUTHORIZED] } unless @current_user.update_columns(sessions: @current_user.sessions - [@token])
        
      { success: true }
    end
  end
end