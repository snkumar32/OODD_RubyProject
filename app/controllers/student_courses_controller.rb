class StudentCoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @student_id = params[:id]
    @student_major = Student.find_by(id: @student_id).major
    @student_courses_based_on_major = Course.where("discipline = ?", @student_major)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
