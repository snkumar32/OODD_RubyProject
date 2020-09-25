class TeachersController < ApplicationController
  #before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:index]
  def check_user
    if current_user.category == "Teacher"
      respond_to do |format|
        format.html { redirect_to pages_teacherLandingPage_path(email: current_user.email), notice => 'Not authorized'}
      end
    elsif current_user.category == "Student"
      respond_to do |format|
        format.html { redirect_to pages_landingPage_path(email: current_user.email), notice: 'Not authorized'}
      end
    end
  end
  # GET /teachers
  # GET /teachers.json
  def teacher_params
    params.require(:teacher).permit(:name, :email, :address, :discipline, :phone)
  end

  def current_teacher
    Teacher.find_by(params[:id])
  end

  def index
    @teachers = Teacher.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params.require(:teacher).permit(:name, :email, :address, :discipline, :phone))
    #redirect_to '/teachers'
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      if @teacher.update(params.require(:teacher).permit(:name, :email, :address, :discipline, :phone))
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @user_value = User.find_by(email: @teacher.email)
    @teacher.destroy
    #TeacherCourse.delete_all(teacherid: params[:id])
    TeacherCourse.where(teacherid: params[:id]).destroy_all
    CourseRegistration.where(:teacherid => params[:id]).destroy_all
    Feedback.where(:teacherid => params[:id]).destroy_all
    StudentCourse.where(:teacherid => params[:id]).destroy_all
    @user_value.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
