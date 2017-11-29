class ApplicationController < ActionController::API
  include Auth

  before_action :authenticate_request
  before_action :authorize_user

  attr_accessor :current_user, :managed_user

  protected

  def authenticate_request
    if auth = request.headers['Authorization']
      self.current_user = authenticate(auth)
    end

    unless self.current_user
      render json: { error: 'Authorization header invalid' }, status: :unauthorized
    end
  end

  def authorize_user
    return unless params[:user_id]
    return if current_user.user?

    self.managed_user = User.find(params[:user_id])
  end
end
