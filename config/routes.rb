Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'teachers_login/show'
  #get 'admins/adminLogin'
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins
  resources :students
  resources :courses
  post 'view_courses/:id', to: 'view_courses#create', :as => 'view_courses'
  post 'student_courses/:id', to: 'student_courses#create', :as => 'student_courses'

  get 'view_courses/:id' => "view_courses#show"
  get 'student_courses/:id' => "student_courses#show"
  resources :view_courses
  resources :cart
  #post 'view_courses/:id', to: 'view_courses#create', :as => 'view_courses'
  #get 'view_courses/:id' => "view_courses#show"
  resources :student_courses
  # ---------------> remember not to put pages controller as resources <-----------------
  get 'pages/landingPage'
  get 'pages/teacherLandingPage'
  get 'pages/addTeacherDetails'
  get 'pages/addStudentDetails'
  root to: "pages#show"
 end
