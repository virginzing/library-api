module Authentication
  class CurrentUser < ApplicationService
    def initialize(token)
      @token = token
    end

    def call
      decoded = Authentication::Token.jwt_decode(@token)
  
      user = User.find_by_id(decoded[:user_id])

      return { success: false, errors: [ErrorsMessage::TOKEN_IS_INVALID] } unless user
      return { success: false, errors: [ErrorsMessage::TOKEN_IS_INVALID] } unless user.sessions.include?(@token)
        
      { success: true, user: user }
    end
  end
end