Rails.application.routes.draw do
  root to: 'ports#index'
  post '/ports/batch_create_csv', to: 'ports#create_from_csv'
  resources :ports
end
