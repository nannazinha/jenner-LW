class AppointmentsController < ApplicationController
  before_action :set_laboratory, only: [:new]
  before_action :set_member, only: [:new]
  before_action :set_vaccine, only: [:new]


  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save!
      redirect_to @appointment
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end



  private

  def set_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_vaccine
    @vaccine = Vaccine.find(params[:vaccine_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status, :price, :laboratory_id, :member_id, :vaccine_id)
  end


end
