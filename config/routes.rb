Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  #devise_for :users
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

 # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :pages, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :destroy]

  resources :user_skills, only: [ :create, :update]

  resources :projects, only: [ :new, :create, :show, :index, :destroy, :edit, :update] do
    resources :jobs, only: [ :create, :destroy]
    resources :host_reviews, only: [:create, :destroy]
  end

  resources :jobs, only: [:destroy ] do
    resources :job_reviews, only: [ :create ]
    resources :responses, only: [:create]
  end

  resources :responses, only: [:destroy, :update, :index]

  resources :pages, only: [:show]
end
