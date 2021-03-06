Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'details', to: 'users/registrations#new_detail'
    post 'details', to: 'users/registrations#create_detail'
    get 'details',  to: 'users/registrations#edit_detail'
    patch 'details', to: 'users/registrations#update_detail'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  get 'home/index'
  get 'users/search'
  root to: "home#index"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      put :follow, :unfollow
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    member do
      get 'search'
    end
  end
  get 'tops/index'
end
