class RegisteredCourseController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.category == "Teacher"
      @teacher_id = params[:id]
      @teacher_history = params[:history]
      @teacher_course = TeacherCourse.where("teacherid=? AND status=?", @teacher_id, "in-progress")
    else
      @student_id = params[:id]
      @student_history = params[:history]
      @courses_registered_students = CourseRegistration.where("studentid=?",@student_id)
    end

  end
end
