class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery
  def after_sign_in_path_for(resource)
    #check = User.select('category').find_by("email" => params[:email])
    #user = User.find_by(params[:email])
    #if user.category.eql?("Teacher")
    $signup_email = current_user.email
    if current_user.category == "admin"
      "/admins/show"
    elsif current_user.category == "Teacher" || current_user.category == "Admin"
      "/pages/teacherLandingPage?email="+current_user.email
    else
      "/pages/landingPage?email="+current_user.email
    end
  end
end
