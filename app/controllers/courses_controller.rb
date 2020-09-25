class CoursesController < ApplicationController
  #before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user
  def check_user
    if current_user.category == "Teacher"
        redirect_to pages_teacherLandingPage_path(email: current_user.email), notice => 'Not authorized.'
    elsif current_user.category == "Student"
        redirect_to pages_landingPage_path(email: current_user.email), notice => 'Not authorized.'
    end
  end

  def courses_params
    params.require(:course).permit(:name, :number, :discipline, :area, :price)
  end

  def current_course
    Course.find_by(params[:id])
  end

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses}
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(courses_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update(courses_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    TeacherCourse.where(courseid: params[:id]).destroy_all
    CourseRegistration.where(courseid: params[:id]).destroy_all
    StudentCourse.where(courseid: params[:id]).destroy_all
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase_history_student
    if current_user.category == "admin"
      @course = Course.find(params[:id])
      if CourseRegistration.exists?(:courseid => @course)
        @cr = CourseRegistration.where("courseid = ?", params[:id])
        respond_to do |format|
          format.html
          end
      else
        respond_to do |format|
          format.html { redirect_to courses_url, notice: 'Course - No Purchase history' }
        end
      end
    else

    end
    end

end
