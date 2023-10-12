Rails.application.routes.draw do
  get 'admin_login', to: 'sessions#new'
  post 'admin_login', to: 'sessions#create'
  delete 'admin_logout', to: 'sessions#destroy'
  get 'comments/create'
  resources :acts do
    resources :comments, only: %i[create], shallow: true
  end
  root 'static_pages#before_login'
  resources :tasks
  get '/after_login', to: 'static_pages#after_login'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'
end
