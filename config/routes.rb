Tasklistjairo::Application.routes.draw do   

  devise_for :users 

  resources :tasks
  resources :categories
  resources :authors
 
  root :to => "tasks#index"
  #root :to => "users#sign_in"
 
end
