Rails.application.routes.draw do
  resources :posts
  resources :sites
  resources :news_sources do
    member do
      get :like
    end
  end
  resources :subscribers do
    member do
      get :confirm, :unsubscribe, :resubscribe
    end
  end
  devise_for :users
  resources :categories
  root 'home#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'ainews', to: 'pages#ainews'
  resources :items
  resources :feed_sources do
    member do
      get :fetch
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
