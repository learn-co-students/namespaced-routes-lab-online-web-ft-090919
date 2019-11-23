Rails.application.routes.draw do

  namespace :admin do
    resources :preferences, only: [:index] # :toggle_artists
  end

  get '/admin/preferences/toggle_artists', to: 'admin/preferences#toggle_artists'

  resources :artists do
    resources :songs, only: [:index, :show]
  end
  resources :songs

end
