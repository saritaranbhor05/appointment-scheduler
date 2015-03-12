class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :get_pet, only: [:index, :new, :create]
  load_and_authorize_resource

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = @pet.blank? ? Appointment.all : @pet.appointments
    @appointments = @appointments.where(
      doctor_id: current_user.id) if current_user.doctor?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    @pet = @appointment.pet
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        respond_on_success(format, 'create')
      else
        respond_on_failure(format, 'new')
      end
    end
  end

  def respond_on_success(format, cur_act)
    suc_msg = 'Appointment was successfully created.'
    suc_msg = 'Appointment was successfully updated.' if cur_act.eql?('update')
    format.html do
      redirect_to @appointment, notice: suc_msg
    end
    format.json { render json: @appointment, status: :created }
  end

  def respond_on_failure(format, cur_action)
    format.html { render action: cur_action }
    format.json do
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        respond_on_success(format, 'update')
      else
        respond_on_failure(format, 'edit')
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(
        :visit_date, :reason, :required_reminder, :pet_id, :customer_id, :doctor_id)
    end

    def get_pet
      @pet = Pet.find_by(id: params[:pet_id] || params[:appointment][:pet_id])
    end
end
