Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  # get "admin_users_index", to: "users#admin_users_index"

  resources :users_admin, :controller => 'users', only: [:index, :create]

  resources :divisions, only: [:index, :create, :update, :destroy, :edit] do
  	resources :categories, only: [:edit, :update, :create, :destroy]
  end

  resources :categories do
    resources :company_skills, only: [:create, :update, :destroy]
  end

end
