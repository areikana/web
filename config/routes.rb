Rails.application.routes.draw do
  root "pages#home"

  # ユーザー登録
  resources :users, only: [:new, :create]
get    "/login",  to: "sessions#new",     as: :login
post   "/login",  to: "sessions#create"
delete "/logout", to: "sessions#destroy", as: :logout

end
