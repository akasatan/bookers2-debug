Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    collection do
      get 'search' => 'user#search'
    end
    resources :relationships, only: [:create, :destroy] do
      member do
        get 'following' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end
    end
  end
  resources :books do
   resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
end