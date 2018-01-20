Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  # get "admin_users_index", to: "users#admin_users_index"

  resources :users_admin, :controller => 'users', only: [:index, :create]

  resources :divisions, only: [:index, :create, :update, :destroy, :edit] do
    resources :categories, only: [:edit, :create, :destroy]
  end

  # divisions
  post "division_update_api", to: "divisions#update_api"

  # categories
  post "category_new_api", to: "categories#new_api"
  post "category_update_api", to: "categories#update_api"
  post "category_destroy_api", to: "categories#destroy_api"
  # company_skills
  post "company_skill_new_api", to: "company_skills#new_api"
  post "company_skill_update_api", to: "company_skills#update_api"
  post "company_skill_destroy_api", to: "company_skills#destroy_api"
end
