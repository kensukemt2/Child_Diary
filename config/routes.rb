Rails.application.routes.draw do
  root to: 'users#new'

  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :circles
  resources :trouble_bords, only: %i[index create show destroy] do
    resources :bord_comments, only: %i[create edit update destroy]
  end
  resources :favorite_posts, only: %i[create destroy]
  resources :favorite_users, only: %i[create destroy]
  resources :circle_members, only: %i[create destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
