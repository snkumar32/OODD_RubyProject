class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    #check = User.select('category').find_by("email" => params[:email])
    #user = User.find_by(params[:email])
    #if user.category.eql?("Teacher")
    if current_user.email == "admin@admin"
      "/admins/show"
    elsif current_user.category == "Teacher"
      "/pages/teacherLandingPage"
    else
      "/pages/landingPage"
    end
  end
end
