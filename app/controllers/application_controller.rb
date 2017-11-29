class ApplicationController < ActionController::API
  include Auth

  before_action :authenticate_request

  attr_accessor :current_user

  protected

  def authenticate_request
    if auth = request.headers['Authorization']
      self.current_user = authenticate(auth)
    end

    unless self.current_user
      render json: { error: 'Authorization header invalid' }, status: :unauthorized
    end
  end
end
