class ApplicationController < ActionController::API
  skip_before_action :authenticate_request 
end
