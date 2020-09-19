class CartController < ApplicationController
  before_action :authenticate_user!

  def destroy
    #@student_cart = StudentCourse.find_by(studentid: params[:studentid])
    @student_cart = StudentCourse.where("studentid = ?", params[:studentid])
    @student_cart.each do |scart|
      scart.destroy
    end
    respond_to do |format|
      format.html { redirect_to student_course_path, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @student_cart = StudentCourse.where("studentid = ?", params[:studentid])
    @student_id_for_reg = params[:studentid]
    #@student_cart = StudentCourse.find_by(studentid: params[:studentid])
    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
