Rails.application.routes.draw do
  scope :api do
    resources :time_zones
    resources :users do
      resources :time_zones
    end

    post 'authenticate', to: 'authentication#authenticate'
    post 'signup', to: 'authentication#signup'
  end

  root to: -> (env) { [404, {"Content-Type" => "text/html"}, ["please use the /api scope"]] }
end
