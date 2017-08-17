Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show ]

  resources :user_skills, only: [ :create, :update]

  resources :projects, only: [ :new, :create, :show, :index, :destroy, :edit, :update] do
    resources :jobs, only: [ :create]
    resources :host_reviews, only: [:create]
  end

  resources :jobs, only: [:destroy ] do
    resources :job_review, only: [ :create ]
    resources :response, only: [:create]
  end

  resources :response, only: [:destroy, :update]

  resources :pages, only: [:show]
end
