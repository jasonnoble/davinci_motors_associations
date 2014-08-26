Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'cars#index'

  resources :cars do
    member do
      # /cars/5/claim
      get 'claim' => 'cars#claim'
      get 'unclaim' => 'cars#unclaim'
    end
    # collection do
    #   /cars/foo
    #   get 'foo'
    # end
  end

  get 'my_cars' => 'cars#my_cars'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }

  get '/login',
    to: 'sessions#login',
    as: 'login'

  post '/login' => 'sessions#create'

  delete '/logout',
    to: 'sessions#destroy'

end
