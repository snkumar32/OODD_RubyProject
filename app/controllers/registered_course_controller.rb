class RegisteredCourseController < ApplicationController
  before_action :authenticate_user!
  def show
      @category_check = User.find_by(id: $userId).category
      if current_user.category == "Teacher" || (current_user.category == "admin" && @category_check == "Teacher")
      @teacher_id = params[:id]
      @teacher_history = params[:history]
      @teacher_course = TeacherCourse.where("teacherid=? AND status=?", @teacher_id, "in-progress")
      @teacher_course_history = TeacherCourse.where("teacherid=?", @teacher_id)
    elsif current_user.category == "Student" || (current_user.category == "admin" && @category_check == "Student")
      @student_id = params[:id]
      @student_history = params[:history]
      @courses_registered_students = CourseRegistration.where("studentid=?",@student_id)
    end

  end
end
