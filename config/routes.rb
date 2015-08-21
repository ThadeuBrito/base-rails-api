Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => {:registrations => "registrations", :sessions => "sessions"}

    resources :users, only: [:create, :delete, :update]

  end

end
