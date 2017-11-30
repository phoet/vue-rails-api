class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    if user = login(params[:email], params[:password])
      payload = {
        user_id: user.id,
        user: user.as_json,
      }
      render json: { auth_token: auth_token(payload) }
    else
      render json: { error: 'credentials invalid' }, status: :unauthorized
    end
  end
end
