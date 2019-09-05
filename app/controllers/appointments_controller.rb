class AppointmentsController < ApplicationController
  before_action :set_laboratory, only: [:new]
  before_action :set_member, only: [:new]
  before_action :set_vaccine, only: [:new]

  def index
    @appointments = Appointment.joins(:member).where(members: {user: current_user})
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    respond_to do |format|
      format.html
      format.js
    end
    @price = LaboratoryVaccine.where(laboratory: @laboratory, vaccine: @vaccine).last.price
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @price = LaboratoryVaccine.where(laboratory: @appointment.laboratory, vaccine: @appointment.vaccine).last.price
    @appointment.price = @price

    if @appointment.save!
      # raise
      member_vaccine = MemberVaccine.find_by(vaccine: @appointment.vaccine, member: @appointment.member)
      member_vaccine.vaccinated = false
      member_vaccine.save
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
