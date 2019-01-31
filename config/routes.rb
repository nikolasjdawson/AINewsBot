Rails.application.routes.draw do
  resources :subscribers do
    member do
      get :confirm, :unsubscribe
    end
  end
  devise_for :users
  resources :categories
  root 'home#index'
  resources :items
  resources :feed_sources do
    member do
      get :fetch
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
