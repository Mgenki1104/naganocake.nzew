Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    #get 'genres/index'
    #get 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
  end
  devise_for :admin
  root to: 'admin/homes#top'
end

Refile.secret_key = 'e3c49c3d1efa58fc322021790c2c345243a189b0d58e118bc640c78f5c58a6a540b9a394c641299e1011f44d55e8922baa53548b62ec4becbec17e232b4bacee'