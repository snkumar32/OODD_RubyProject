class PaymentsController < ApplicationController
  #before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.find_by(studentid: params[:studentid])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments}
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find_by(params[:studentid])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find_by(params[:studentid])

  end

  def use
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params.require(:payment).permit(:studentid, :cname, :cnumber, :expMonth, :expYr, :cvv))
    @cname = @payment.cname
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :display, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    @payment = Payment.find_by(params[:studentid])
    respond_to do |format|
      if @payment.update(params.require(:payment).permit(:studentid, :cname, :cnumber, :expMonth, :expYr, :cvv))
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find_by(params[:studentid])
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to student_course_path(id: $csid), notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:studentid, :cname, :cnumber, :expMonth, :expYr, :cvv)
    end
end
