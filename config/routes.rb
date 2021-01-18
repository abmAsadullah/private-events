Rails.application.routes.draw do
  root to: 'events#index'
  resources :events
  resources :event_attendees
  devise_for :users
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
