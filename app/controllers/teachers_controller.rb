class TeachersController < ApplicationController
  #before_action :set_teacher, only: [:show, :edit, :update, :destroy]

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
      format.json { render json: @teachers}
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
      if @teacher.update(teacher_params)
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
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
