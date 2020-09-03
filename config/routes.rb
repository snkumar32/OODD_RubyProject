Rails.application.routes.draw do
  resources :students
  get 'access/index'
  get 'access/login'
  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
