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
    @student_major = Student.find_by(id: @student_id).major #get major
    @student_courses_based_on_major = Course.where("discipline = ?", @student_major) #course where discipline = major
    @student_courses_based_on_major.each do |course|
      @course_id = course.id
      @student_courses_teacher = TeacherCourse.where('courseid' => @course_id) #teacher for that course
      @student_courses_teacher.each do |t|
        # @tid = Teacher.find_by(id: t.teacherid ).id
        # @tname = Teacher.find_by(id: t.teacherid ).name
        @teacher_course_dict[@course_id]  <<  Teacher.find_by(id: t.teacherid ).id
      end
      respond_to do |format|
        format.html # show.html.erb
      end
    end
    @new_cart = StudentCourse.new(params.permit(:teacherid, :courseid, :studentid))
  end

def create
  #@studentid = params[:studentid]
  #@courseid = params[:courseid]
  # @teacherid= params[:teacherid]
  @new_cart = StudentCourse.new(params.require(:student_course).permit(:teacherid, :courseid, :studentid))
  respond_to do |format|
    if StudentCourse.exists?(:courseid => @new_cart.courseid, :studentid => @new_cart.studentid)
      format.html { redirect_to student_course_path, notice: 'Value exists. No update.' }
    else
      if @new_cart.save
        format.html { redirect_to student_course_path, notice: 'Successfully added to cart.' }
        format.json { render :show, status: :created, location: @new_cart }
      else
        format.html { render :new }
        format.json { render json: @new_cart.errors, status: :unprocessable_entity }
      end
    end
  end
end

  def destroy
    @cart = StudentCourse.find_by( courseid: params[:courseid], studentid: params[:studentid])
    if StudentCourse.exists?(:courseid => params[:courseid],  studentid: params[:studentid])
      @cart.destroy
      respond_to do |format|
        format.html { redirect_to student_course_path, notice: 'Successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to student_course_path, notice: 'Value does not exist' }
      end
    end
  end
end