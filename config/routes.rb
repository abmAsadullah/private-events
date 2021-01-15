Rails.application.routes.draw do
  resources :events
  root to: 'pages#home'
  devise_for :users
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
