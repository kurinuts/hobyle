Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  resources :genres
  resources :particicated_events
  resources :participation_events
end
