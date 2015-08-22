Rails.application.routes.draw do

  resources :users, except: [:new, :edit]
  #AUTH
  post "/auth/login", to: "auths#login"
  post "/auth/register", to: "auths#register"
  post "/auth/forgot", to: "auths#forgot"
  put  "/auth/update", to: "auths#update"

  #USER
  resources :users, only: [:create, :delete, :update]


end
