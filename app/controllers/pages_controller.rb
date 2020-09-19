class PagesController < ApplicationController
  def show
  end
  def landingPage
    $userId = User.find_by(email: params[:email]).id
    $csid = Student.find_by(email: params[:email]).id
  end
  def teacherLandingPage
    $userId = User.find_by(email: params[:email]).id
    #$ctid = Teacher.find_by(email: params[:email]).id
  end
end
