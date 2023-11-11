Rails.application.routes.draw do
  resources :plans
  resources :categories
  get 'admin_login', to: 'sessions#new'
  post 'admin_login', to: 'sessions#create'
  delete 'admin_logout', to: 'sessions#destroy'
  get 'comments/create'
  resources :acts do
    resources :comments
  end
  root 'static_pages#before_login'
  resources :tasks
  resources :rooms
  get '/after_login', to: 'static_pages#after_login'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'
  resources :comments
end
