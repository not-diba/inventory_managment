Rails.application.routes.draw do
  root 'departments#index'

  get 'signup', to: 'administrators#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'labs', to: 'labs#index', as: 'labs_index'
  get 'equipment', to: 'equipment#index', as: 'equipment_index'
  resources :departments_table
  resources :show_labs

  resources :departments, shallow: true do
    resources :labs, shallow: true do
      resources :equipment
    end
  end

  resources :administrators
  resources :roles
  resources :sessions
  resources :rooms
end
