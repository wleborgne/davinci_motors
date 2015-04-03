Rails.application.routes.draw do
  root 'cars#index'

  resources :cars

  resources :users,
    only: [:create, :new],
    path_names: { new: 'signup'}

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
end
