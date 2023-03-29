# frozen_string_literal: true

require 'jwt'
module Authentication
  module Token
    extend self

    SECRET_KEY = Rails.application.secret_key_base

    def jwt_encode(payload, exp = 1.day.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def jwt_decode(token)
      begin
        decode = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new(decode)
      rescue JWT::DecodeError
        {}
      end
    end
  end
end