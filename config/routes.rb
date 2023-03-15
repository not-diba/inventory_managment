Rails.application.routes.draw do
  devise_for :administrators
  root 'departments#index'

  resources :departments do
    resources :labs do
      resources :equipment
    end
    resources :rooms do
      resources :equipment
    end
    resources :administrators do
      resources :roles
    end
  end
end
