Rails.application.routes.draw do
  # 1ページ目（体調選択フォーム）
  get "cooks/new", to: "cooks#new", as: :new_cook

  # フォーム送信 → レシピ表示（createアクションを使う）
  post "cooks", to: "cooks#create"

  # show ページ（保存していればIDでアクセス、今回はrenderで済ますなら不要）
  get "cooks/:id", to: "cooks#show", as: :cook

  # root を new ページに設定
  root "cooks#new"

  # ヘルスチェック用
  get "up" => "rails/health#show", as: :rails_health_check

  get "/cooks", to: "cooks#index"
end
