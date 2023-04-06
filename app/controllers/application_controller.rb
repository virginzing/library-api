class ApplicationController < ActionController::API
  before_action :authenticate_request
  
  private

  def authorized_token
    token = request.headers['X-API-KEY']
    token = token.split('Bearer ').last if token

    token
  end

  def authenticate_request
    @token = authorized_token
    get_current_user = Authentication::CurrentUser.call(@token)

    get_current_user.either(
      -> success { @current_user = success[:user] },
      -> failure { render json: { errors: failure[:errors] }, status: 401 }
    )
  end
end
