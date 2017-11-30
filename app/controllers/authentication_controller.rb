class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def signup
    user = User.new(signup_params)

    if user.save
      render json: user_token(user)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def authenticate
    if user = login(params[:email], params[:password])
      render json: user_token(user)
    else
      render json: { error: 'credentials invalid' }, status: :unauthorized
    end
  end

  private

  def user_token(user)
    payload = {
      user_id: user.id,
      user: user.as_json,
    }
    { auth_token: auth_token(payload) }
  end

  def signup_params
    params.permit(:name, :email, :password)
  end
end
