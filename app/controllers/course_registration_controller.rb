class CourseRegistrationController < ApplicationController
  before_action :authenticate_user!

  def create
    @student_cart = StudentCourse.where("studentid=?", params[:studentid])
    @student = Student.find(params[:studentid])
    respond_to do |format|
    @student_cart.each do |scart|
      @tid = scart.teacherid
      @cid = scart.courseid
      @pvalue = Course.find_by(id: scart.courseid).price
      @typevalue  = "in-progress"

      if CourseRegistration.exists?(:courseid => @cid, :studentid => params[:studentid], :teacherid => @tid, :status => "dropped")
        @cr = CourseRegistration.find_by(:teacherid =>  @tid, :courseid =>  @cid, :studentid =>  params[:studentid], :status => "dropped")
        @cr.update_attributes(status: "in-progress")
        @tname = Teacher.find_by(id: @tid)
        message = UserMailer.with(student: @student, teacher: @tname).welcome_email
        message.deliver_now
        message = UserMailer.with(student: @student, teacher: @tname).teacher_notify
        message.deliver_now
        format.html { redirect_to student_course_path(id: params[:studentid]), notice: 'Updated Course Status to Registered!!' }
      elsif CourseRegistration.exists?(:courseid => @cid, :studentid => params[:studentid], :teacherid => @tid)
        format.html { redirect_to student_course_path(id: params[:studentid]), notice: 'Value exists. No update.' }
      else
        c = CourseRegistration.create :teacherid => @tid, :courseid => @cid, :studentid => params[:studentid], :price => @pvalue, :status => @typevalue
        #@student_course_reg.save!
        @tname = Teacher.find_by(id: @tid)
        message = UserMailer.with(student: @student, teacher: @tname).welcome_email
        message.deliver_now
        message = UserMailer.with(student: @student, teacher: @tname).teacher_notify
        message.deliver_now
        StudentCourse.where(teacherid: @tid, courseid: @cid, studentid: params[:studentid]).destroy_all
        format.html { redirect_to student_course_path(id: params[:studentid]), action: "show", notice: 'Placed Order.' }
        end
      end
    end
  end

  def show
    @student_cart = CourseRegistration.where("studentid = ?", params[:studentid])
    #@student_cart = StudentCourse.find_by(studentid: params[:studentid])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def display
    @student_list = CourseRegistration.where("teacherid = ?", params[:teacherid])
    respond_to do |format|
      format.html
    end
  end

  def drop
    @student_list = CourseRegistration.new(params.permit(:studentid, :teacherid, :courseid,:status))
    if CourseRegistration.exists?(:teacherid =>  @student_list.teacherid, :courseid =>  @student_list.courseid, :studentid =>  @student_list.studentid, :status => "in-progress")
      @cr = CourseRegistration.find_by(:teacherid =>  @student_list.teacherid, :courseid =>  @student_list.courseid, :studentid =>  @student_list.studentid)
      @cr.update_attributes(status: "dropped")
      respond_to do |format|
        format.html { redirect_to registered_course_show_path(id: @student_list.studentid), notice: 'Course dropped successfully!' }
      end
    elsif CourseRegistration.exists?(:teacherid =>  @student_list.teacherid, :courseid =>  @student_list.courseid, :studentid =>  @student_list.studentid, :status => @student_list.status)
      respond_to do |format|
        format.html { redirect_to registered_course_show_path(id: @student_list.studentid), notice: 'Course already dropped!' }
      end
    else
      respond_to do |format|
        format.html { redirect_to registered_course_show_path(id: @student_list.studentid), notice: 'Course not registered!' }
      end
    end
  end
end
