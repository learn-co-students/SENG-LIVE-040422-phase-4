Rails.application.routes.draw do
  
  # GROUP ACTIVITY => Add Routes for Update / Destroy Actions

  resources :productions
  resources :production_roles
  resources :tickets
  resources :users
end
