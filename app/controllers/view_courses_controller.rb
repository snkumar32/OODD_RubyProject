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
    @teacher_c = TeacherCourse.new(params.permit(:teacherid, :courseid))
    respond_to do |format|
      if @teacher_c.save
        format.html { redirect_to view_courses_path, notice: 'Successfully registered .' }
        format.json { render :show, status: :created, location: @teacher_c }
      else
        format.html { render :new }
        format.json { render json: @teacher_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher_c = TeacherCourse.find_by(teacherid: params[:teacherid], courseid: params[:courseid])
    @teacher_c.destroy
    respond_to do |format|
      format.html { redirect_to view_courses_path, notice: 'Successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
