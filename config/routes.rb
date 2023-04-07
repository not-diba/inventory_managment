Rails.application.routes.draw do
  devise_for :administrators
  root 'departments#index'

  resources :departments, shallow: true do
    resources :labs, :rooms, shallow: true do
      resources :equipment
    end
    resources :administrators do
      resources :roles
    end
  end
end
