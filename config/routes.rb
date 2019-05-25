Rails.application.routes.draw do
  root to: 'ports#index'
  resources :ports
end
