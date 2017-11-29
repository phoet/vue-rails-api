class ApplicationController < ActionController::API
  include Auth

  before_action :authenticate_request

  attr_accessor :current_user

  protected

  def authenticate_request
    self.current_user = authenticate!(request.headers)
  end
end
