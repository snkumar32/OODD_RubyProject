class RegisteredCourseController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.category == "Teacher"
      @teacher_id = params[:id]
      @teacher_course = TeacherCourse.where("teacherid=?",@teacher_id)
    else
      @student_id = params[:id]
      @courses_registered_students = CourseRegistration.where("studentid=?",@student_id)
    end

  end
end
