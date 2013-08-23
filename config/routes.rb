MyLastWord::Application.routes.draw do
  resources :parametres


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "public#index"

  get '/verification/:token', to: 'validation#verify', as: 'verify'

  namespace :home do
    root :to => 'account#index'
    resources :contacts
    resources :messages
    get '/parameters', to: 'parametres#edit', as: 'parameters'
    post '/parameters', to: 'parametres#update', as: 'parameters'
    get '/profile', to: 'users#edit', as: 'edit_user'
    put '/profile', to: 'users#update'
  end

 # devise_for :admin_users, ActiveAdmin::devise.config
  ActiveAdmin.routes(self)

  match '/auth/:provider/callback' => 'authentications#create'
end
