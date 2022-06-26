Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    resources :events
    get "homes" => "homes#top", as: "homes"
    resources :genres
    resources :users
  end

  scope module: :user do
    get "subgenre" => "events#subgenre"
    get "users/my_events" => "users#my_events"
    get 'unsubscribe' => 'users#unsubscribe', as: 'users_unsubscribe'
    resources :users
    resources :memories
    resources :events do
      patch "active_change" => "events#active_change"
      collection do # idを入れないという意味
        get 'search', to: 'events#search'
      end
    end
    resources :event_users
    get "event_users/cancel" => "event_users#destroy"
  end

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
