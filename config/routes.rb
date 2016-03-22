Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    resources :playlists, only: [:index]
  end

  root 'static_pages#home'

  # root 'playlists#index'

  resources :playlists do
    resources :songs
    resources :comments
  end

  resources :playlists_songs do
    resources :songs
  end

end
