class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    appointment_date = @appointment.appointment_date.to_date
    start_date = @transaction.start_date.to_date
    end_date = @transaction.end_date.to_date
    @appointment.available_times = [1, ((end_date - start_date).to_i)].max * @item.price
    @appointment.member = @appointment
    @appointment.user = current_user
    if @appointment.save!
      redirect_to member_path(@member)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    @appointment.update(appointment_params)
    redirect_to member_path(@member)
  end

  def destroy
    @appointment.destroy
    redirect_to members_path
  end

  def available_times

  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status, :price, :laboratory_id, :vaccine_id, :member_id)
  end
end
