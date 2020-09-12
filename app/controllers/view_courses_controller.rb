class ViewCoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  def show
    @teacher_id = params[:id]
    #@teacher_course = Teacher.select(:discipline).where("id = ?", @teacher_id)
    @teacher_course = Teacher.find_by(id: @teacher_id).discipline
    @final_course = Course.where("discipline = ?", @teacher_course)

    # @view_course = Teacher.find(params[:name])
    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @view_course }
    end
  end


  def create
    @teacher_course = TeacherCourse.new(params.require(:TeacherCourse).permit(:teacherid, :courseid))
    respond_to do |format|
      if @teacher_course.save
        format.html { redirect_to '/students', notice: 'T_C was successfully created.' }
    end
    end
  end
end
