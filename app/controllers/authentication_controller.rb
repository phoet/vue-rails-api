class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    if user = login(params[:email], params[:password])
      render json: { auth_token: auth_token(user.id) }
    else
      render json: { error: 'credentials invalid' }, status: :unauthorized
    end
  end
end
