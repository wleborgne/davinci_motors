Rails.application.routes.draw do
  root 'cars#index'

  resources :cars do
    member do
      get 'claim' => 'cars#claim'
    end
    
    collection do
      # stuff for all cars; e.g. wash
    end
  end

  resources :users,
    only: [:create, :new],
    path_names: { new: 'signup'}
  
  get 'my_cars' => 'users#my_cars'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
end
