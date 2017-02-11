Rails.application.routes.draw do
  root :to => 'shops#show'

  mount ShopifyApp::Engine, at: '/'

  get '/auth/slack/callback' => 'omniauth_callbacks#slack'

  resources :shops, only: [:show, :edit, :update]
end
