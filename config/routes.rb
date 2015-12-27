Rails.application.routes.draw do
  devise_for :users
  get '/dashboard' => 'dashboard#index'
  post '/' => 'home#shorten'
  root to: 'home#index'
  get '/:id' => 'shortener/shortened_urls#show'
end
