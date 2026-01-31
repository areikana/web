Rails.application.routes.draw do
  root "home#index"

  # ユーザー登録
  get  "/users/new", to: "users#new",  as: :new_user
  post "/users",     to: "users#create", as: :users

  # ログイン/ログアウト
  get    "/login",  to: "sessions#new",    as: :login
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
end