class StudentsController < ApplicationController
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
  # GET /students
  # GET /students.json
  def student_params
    params.require(:student).permit(:name, :email, :address, :major, :phone)
  end

  def current_student
    Student.find_by(params[:id])
  end

  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students}
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  def new
    $student_signup = params[:email]
    @student = Student.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @user_value = User.find_by(email: @student.email)
    @student.destroy
    CourseRegistration.where(:studentid => params[:id]).destroy_all
    StudentCourse.where(:studentid => params[:id]).destroy_all
    Payment.where(:studentid => params[:id]).destroy_all
    @user_value.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
