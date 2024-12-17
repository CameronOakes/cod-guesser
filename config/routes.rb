Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'game#index'

  get 'game', to: 'game#index'

  post 'game/submit', to: 'game#submit'
end
