Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  # root 'playlists#index'

  resources :playlists do
    resources :songs
  end

  resources :playlists_songs do
    resources :songs
  end
end
