class StudentCoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @student_id = params[:id]
    @teacher_course_dict = Hash.new{|hsh,key| hsh[key] = [] }
    @student_major = Student.find_by(id: @student_id).major
    @student_courses_based_on_major = Course.where("discipline = ?", @student_major)
    @student_courses_based_on_major.each do |course|
      @course_id = course.id
      @student_courses_teacher = TeacherCourse.where('courseid' => @course_id)
      @student_courses_teacher.each do |t|
        @teacher_course_dict[@course_id]  <<  Teacher.find_by(id: t.teacherid ).name
        end
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
  end