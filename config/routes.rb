Rails.application.routes.draw do
  resources :sites, only: [:index, :update]
  root to: 'sites#index'
end
