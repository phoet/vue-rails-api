class ApplicationController < ActionController::API
  include Auth

  before_action :authenticate_request

  attr_accessor :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :_404

  protected

  def _404(exception)
    Rails.logger.warn exception
    Rails.logger.warn "head 404 with params #{params}"
    head 404
  end

  def authenticate_request
    auth = request.headers['Authorization']
    if auth.present?
      self.current_user = authenticate(auth)
    end

    unless self.current_user
      render json: { error: 'Authorization header invalid' }, status: :unauthorized
    end
  end
end
