class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :category)
  end

  def after_sign_up_path_for(resource)
    if resource.category=='Student'
      "/students/new?email="+resource.email
    else
      "/teachers/new?email="+resource.email
    end
  end
  end
