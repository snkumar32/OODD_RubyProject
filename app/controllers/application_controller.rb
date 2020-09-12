class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.category == "Teacher"
      "/pages/teacherLandingPage"
    else
        "/pages/landingPage"
  end
  end
  end
