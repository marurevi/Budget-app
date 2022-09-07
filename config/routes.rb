Rails.application.routes.draw do
  devise_for :users
  
  root "splash#index"

  resources :groups, only: [:index, :new, :create] do
    resources :operations, only: [:index, :new, :create]
  end
end
