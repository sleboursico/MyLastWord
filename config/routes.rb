MyLastWord::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "public#index"

  namespace :home do
    root :to => 'account#index'
    resources :contacts
    resources :users, :only => [:edit, :update]
    resources :messages
  end

 # devise_for :admin_users, ActiveAdmin::devise.config
  ActiveAdmin.routes(self)

  match '/auth/:provider/callback' => 'authentications#create'
end
