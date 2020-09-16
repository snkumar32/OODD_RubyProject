class PagesController < ApplicationController
  def show
  end
  def landingPage
    @teacher = Teacher.new
  end
  def teacherLandingPage
  end
end
