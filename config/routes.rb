Rails.application.routes.draw do
  devise_for :users
  get '/dashboard' => 'dashboard#index'
  root to: 'home#index'
  get '/:id' => 'shortener/shortened_urls#show'
end
