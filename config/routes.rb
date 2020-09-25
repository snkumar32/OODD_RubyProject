Rails.application.routes.draw do
  resources :payments
  resources :feedbacks
  get 'registered_course/show'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'teachers_login/show'
  #get 'admins/adminLogin'
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins
  resources :students
  resources :courses
  resources :feedbacks


  post 'view_courses/:id', to: 'view_courses#create', :as => 'view_courses'
  put 'view_courses/:id', to: 'view_courses#drop', :as => 'view_courses_drop'

  post 'student_courses/:id', to: 'student_courses#create', :as => 'student_courses'
  post 'course_registration/:id', to: 'course_registration#create', :as => 'course_registration'


  get 'view_courses/:id' => "view_courses#show"
  get 'student_courses/:id' => "student_courses#show"
  get 'course_registration/:id' => "course_registration#show"
  get 'course_registration_path/:teacherid' => "course_registration#display", as: :course_registration_display

  get 'feedbacks_path/:teacherid' => "feedbacks#display", as: :feedbacks_path
  get 'feedbacks_path/:teacherid/:courseid/:studentid' => "feedbacks_path#index"
  get 'edit_teacher_path/:id/:email' => 'teachers#edit', as: :edit_teacher_path
  get 'edit_student_path/:id/:email' => 'students#edit', as: :edit_student_path
  get 'courses/purchase_history_student/:id' => "courses#purchase_history_student", as: :purchase_history_student



  #get 'payments/:studentid' => "payments#display", as: :payments_path
  get 'payments/:studentid' => "payments#show"

  put 'course_registration/:id' => 'course_registration#drop', as: :course_registration_drop

  resources :feedbacks
  resources :view_courses
  resources :cart
  resources :course_registration

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
