class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @laboratory = Laboratory.find(params[:laboratory_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.laboratory = @laboratory
    @appointment.user = current_user
    if @appointment.save!
      redirect_to laboratory_path(@laboratory)
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

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status, :price, :laboratory_id, :vaccine_id, :member_id)
  end
end
