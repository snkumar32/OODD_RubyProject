class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:display]

  def check_user
    if current_user.category != "admin" && current_user.category == 'Teacher'
      if User.find_by(id: $userId).email != Teacher.find_by(id: params[:teacherid]).email
        redirect_to pages_teacherLandingPage_path(email: current_user.email), notice => 'Not authorized.'
      end
    end
  end

  def index
    #@feedback = Feedback.new(params.permit(:teacherid, :courseid, :ftext))
    @feedback = Feedback.new(params.permit(:teacherid, :courseid, :ftext, :studentid))
    if Feedback.exists?(:teacherid => params[:teacherid], :courseid => params[:courseid], :studentid => params[:studentid])
      @feedback_text = Feedback.find_by(:teacherid => params[:teacherid], :courseid => params[:courseid], :studentid => params[:studentid]).ftext
    end
    @feedback_tid = params[:teacherid]
    @feedback_cid = params[:courseid]

  end

  def display
    #@feedback = Feedback.new(params.permit(:teacherid, :courseid, :ftext))
    @feedback = Feedback.new(params.permit(:teacherid))
    @feedback_teacher = Feedback.where(:teacherid => params[:teacherid])
    @feedback_tid = params[:teacherid]

  end

  def show
    @feedbacks = Feedback.new(params.permit(:teacherid, :courseid, :ftext))
    @feedback_tid = params[:teacherid]
    @feedback_cid = params[:courseid]
  end


  def new
    @feedback = Feedback.new(params.permit(:teacherid, :courseid, :ftext, :studentid))
    student_id = Student.find_by(email: current_user.email)
      if Feedback.exists?(:courseid => @feedback.courseid, :teacherid => @feedback.teacherid, :studentid => @feedback.studentid)
        respond_to do |format|
        format.html { redirect_to registered_course_show_path(id: student_id), notice: 'Value exists. No update.' }
      end
    end
end

  def edit
    @feedback = Feedback.find_by(teacherid: params[:teacherid], courseid: params[:courseid])
  end


  def create
    @feedback = Feedback.new(params.require(:feedback).permit(:teacherid, :courseid, :ftext, :studentid))
    student_id = Student.find_by(email: current_user.email)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to registered_course_show_path(id: student_id), notice: 'Feedback was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @feedback.update(Feedback.new(params.require(:feedback).permit(:teacherid, :courseid, :ftext)))
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
