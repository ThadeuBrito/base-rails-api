Rails.application.routes.draw do

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => {:registrations => "registrations", :sessions => "sessions"}

end
