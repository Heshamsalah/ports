Rails.application.routes.draw do
  root to: 'ports#index'

  post '/login', to: 'sessions#login', as: :login
  post '/signup', to: 'sessions#signup', as: :signup

  post '/ports/batch_create_csv', to: 'ports#create_from_csv',
                                  as: :batch_create_csv
  resources :ports
end
