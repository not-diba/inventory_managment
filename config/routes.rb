Rails.application.routes.draw do
  root "departments#index"

  resources :departments
end
