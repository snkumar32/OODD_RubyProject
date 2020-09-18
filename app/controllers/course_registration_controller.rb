class CourseRegistrationController < ApplicationController
  def create
    @student_cart = StudentCourse.where("studentid=?", params[:studentid])
    #@student_id_for_reg = params[:studentid]
    respond_to do |format|
    #@student_cart = StudentCourse.find_by(studentid: params[:studentid])
    @student_cart.each do |scart|
      #params[:teacherid] = scart.teacherid
      #params[:courseid] = scart.courseid
      #params[:price] = Course.find_by(id: scart.courseid).price
      #params[:type] = "in-progress"
      @tid = scart.teacherid
      @cid = scart.courseid
      @pvalue = Course.find_by(id: scart.courseid).price
      @typevalue  = "in-progress"

      if CourseRegistration.exists?(:courseid => @cid, :studentid => params[:studentid], :teacherid => @tid)
        format.html { redirect_to pages_landingPage_path(email: current_user.email), notice: 'Value exists. No update.' }
      else
        c = CourseRegistration.create :teacherid => @tid, :courseid => @cid, :studentid => params[:studentid], :price => @pvalue, :status => @typevalue
        #@student_course_reg.save!
        StudentCourse.where(teacherid: @tid, courseid: @cid, studentid: params[:studentid]).destroy_all
         format.html { redirect_to pages_landingPage_path(email: current_user.email), action: "show", notice: 'Placed Order.' }
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
end
