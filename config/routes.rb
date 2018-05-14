Rails.application.routes.draw do
  root to: 'users#new'

  resources :posts
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :circles
  resources :trouble_bords, only: %i[index create show destroy]
  resources :bord_comments, only: %i[create destroy]
  resources :favorite_posts, only: %i[create destroy]
  resources :favorite_users, only: %i[create destroy]
  resources :circle_members, only: %i[create destroy]
end
