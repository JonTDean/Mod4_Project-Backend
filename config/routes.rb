Rails.application.routes.draw do
  resources :users, only: %i[index]
  resources :players, only: %i[index, show]

  # Custom Routing for Login
  post '/login', to: 'users#login'        # Custom Route for Login POST Requests
  post '/signup', to: 'users#create'      # Custom Route for Create POST Requests
  get '/autologin', to: 'users#autologin' # Logs in User for persistence across the page scanning
  get '/logout', to: 'users#logout'       # Logs out the Current User
  patch '/profile', to: 'users#profile'   # Allows customization of User Data

  # Custom Routing for Player
  post '/character_creation', to: 'players#create'
  get '/findPlayer', to: 'players#findPlayerByName'
  
end
