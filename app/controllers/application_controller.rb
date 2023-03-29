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
    current_user = Authentication::CurrentUser.call(@token)

    if current_user[:success]
      @current_user = current_user[:user]
    else
      render json: { errors: current_user[:errors] }, status: 401
    end
  end
end
