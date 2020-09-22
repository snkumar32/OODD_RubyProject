class ViewCoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  def show
    @history_value = params[:history]
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
    @teacher_c = TeacherCourse.new(params.permit(:teacherid, :courseid, :status))
    respond_to do |format|
      if TeacherCourse.exists?(:teacherid => @teacher_c.teacherid, :courseid => @teacher_c.courseid, :status => @teacher_c.status)
        format.html { redirect_to view_courses_path, notice: 'Course exists. No update!' }
      elsif TeacherCourse.exists?(:teacherid => @teacher_c.teacherid, :courseid => @teacher_c.courseid, :status => "dropped")
        @tc = TeacherCourse.find_by(:teacherid =>  @teacher_c.teacherid, :courseid =>  @teacher_c.courseid)
        @tc.update_attributes(status: "in-progress")
        format.html { redirect_to view_courses_path, notice: 'Successfully updated.' }
      else
        if @teacher_c.save
          format.html { redirect_to view_courses_path, notice: 'Success! New registration!' }
          format.json { render :show, status: :created, location: @teacher_c }
        else
          format.html { render :new }
          format.json { render json: @teacher_course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def drop
    @teacher_c = TeacherCourse.new(params.permit(:teacherid, :courseid, :status))
    #@teacher_c = TeacherCourse.find_by(teacherid: params[:teacherid], courseid: params[:courseid])
    if TeacherCourse.exists?(:teacherid =>  @teacher_c.teacherid, :courseid =>  @teacher_c.courseid, :status => "in-progress")
      @tc = TeacherCourse.find_by(:teacherid =>  @teacher_c.teacherid, :courseid =>  @teacher_c.courseid)
      @tc.update_attributes(status: "dropped")
      respond_to do |format|
        format.html { redirect_to view_courses_path, notice: 'Course dropped successfully!' }
      end
    elsif TeacherCourse.exists?(:teacherid =>  @teacher_c.teacherid, :courseid =>  @teacher_c.courseid, :status => @teacher_c.status)
      respond_to do |format|
      format.html { redirect_to view_courses_path, notice: 'Course already dropped!' }
      end
    else
      respond_to do |format|
        format.html { redirect_to view_courses_path, notice: 'Course not registered!' }
      end
    end
  end
end
