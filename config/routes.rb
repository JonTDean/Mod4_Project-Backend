Rails.application.routes.draw do
  resources :users, only: %i[create index]
  post '/login', to: 'users#login'        # Custom Route for Login POST Requests
  post '/signup', to: 'users#create'      # Custom Route for Create POST Requests
  get '/autologin', to: 'users#autologin' # Logs in User for persistence across the page scanning
end
