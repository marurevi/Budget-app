Rails.application.routes.draw do
  
  devise_for :users
  get 'users/sessions' => 'users/sessions#new'
  get 'users/registrations' => 'users/registrations#new'
  
  root "splash#index"
  get "home", to: "groups#index"
end
