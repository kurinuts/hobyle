Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
    # passwords: 'admin/passwords',
    # registrations: 'admin/registrations'
  }

  # get '/my_events' => 'user/events#my_events'

  namespace :admin do
    resources :events
    # resources :sessions
    get "homes" => "homes#top", as: "homes"
    resources :genres
    resources :secondgenres
    resources :users
  end

  scope module: :user do
     get "subgenre" => "events#subgenre"
    resources:users
    resources :events do
      patch "active_change" => "events#active_change"
    end
    get "my_events" => "events#my_events"
    resources :event_users
    get "event_users/cancel" => "event_users#destroy"
    # post 'orders/confirm' => 'orders#confirm'
    # get 'orders/complete' => 'orders#complete'
    # get 'unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    # patch 'withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
    # put 'withdraw/:id' => 'customers#withdraw'
  end

  get 'genres/search'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
