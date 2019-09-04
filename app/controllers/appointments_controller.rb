class AppointmentsController < ApplicationController
  before_action :set_laboratory, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_member, only: [:create]
  before_action :set_vaccine, only: [:create]


  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @member = Member.find(params[:member_id])
    @vaccine = Vaccine.find(params[:vaccine_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.vaccine = @vaccine
    @appointment.member = @member

    raise
    if @appointment.save!
      redirect_to laboratory_appointment_path(@appointment)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    @appointment.update(appointment_params)
    redirect_to laboratory_path(@laboratory)
  end

  def destroy
    @appointment.destroy
    redirect_to members_path
  end

  def confirmed
    @appointment = Appointment.find(params[:id])
  end

  private

  def set_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status, :price)
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_vaccine
    @vaccine = Vaccine.find(params[:vaccine_id])
  end
end
