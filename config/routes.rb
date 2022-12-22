Rails.application.routes.draw do
  get 'post/index'
  get 'post/create'
  get 'post/destroy'
  get 'post/update'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
