Rails.application.routes.draw do
  root 'departments#index'

  get 'signup', to: 'administrators#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :departments, shallow: true do
    resources :labs, shallow: true do
      resources :equipment
    end
  end

  resources :administrators
  resources :sessions
end
