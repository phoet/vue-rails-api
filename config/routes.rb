Rails.application.routes.draw do
  scope :api do
    post 'authenticate', to: 'authentication#authenticate'
  end

  root to: -> (env) { [404, {"Content-Type" => "text/html"}, ["please use the /api scope"]] }
end
