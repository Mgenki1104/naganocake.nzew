Rails.application.routes.draw do
  namespace :admin do
    resources :order_details, only: [:update]
    # get 'order_details/update'
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
    # get 'orders/show'
    # get 'orders/update'
  end
  namespace :public do
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirmation'
    get 'orders/thanks'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :public do
    resources :cart_items, only: [:index, :update ,:destroy, :create]
    delete 'cart_items/destroy_all'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

  end
  namespace :public do
    get 'customers/withdrawal_confirmation' => "customers#withdrawal_confirmation"
    patch 'customers/withdrawal' => "customers#withdrawal"
    resources :customers, only: [:show, :edit, :update]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  devise_for(
    :customers,
    path: 'customers',
    module: 'public'
  )

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    #get 'genres/index'
    #get 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
  end
  devise_for :admin
  root to: 'public/homes#top'
end

Refile.secret_key = 'e3c49c3d1efa58fc322021790c2c345243a189b0d58e118bc640c78f5c58a6a540b9a394c641299e1011f44d55e8922baa53548b62ec4becbec17e232b4bacee'