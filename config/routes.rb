Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  # get "admin_users_index", to: "users#admin_users_index"

  resources :users_admin, :controller => 'users', only: [:index, :create]

  # resources :admin_users, only: [:index, :create]
end
