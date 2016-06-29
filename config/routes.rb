Rails.application.routes.draw do

  #AUTH
  post "/auth/login", to: "auths#login"
  post "/auth/register", to: "auths#register"
  post "/auth/forgot", to: "auths#forgot"
  put  "/auth/update", to: "auths#update"

  #USER
  resources :users, except: [:new, :create, :edit]

end
