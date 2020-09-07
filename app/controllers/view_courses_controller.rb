class ViewCoursesController < ApplicationController
  def index


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end
  def show
    @teacher_id =  params[:id]
    #@teacher_course = Teacher.select(:discipline).where("id = ?", @teacher_id)
    @teacher_course = Teacher.find_by(id: @teacher_id).discipline
    @final_course = Course.where("discipline = ?", @teacher_course)
    # @view_course = Teacher.find(params[:name])
    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @view_course }
    end
  end
end
