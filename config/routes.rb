Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'teachers_login/show'
  #get 'admins/adminLogin'
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins
  resources :students
  resources :courses
  resources :view_courses
  # ---------------> remember not to put pages controller as resources <-----------------
  get 'pages/landingPage'
  root to: "pages#show"
 end
