class VaccinesController < ApplicationController
  before_action :set_vaccine, only: [:show, :vaccinate]
  before_action :set_member, only: [:show, :vaccinate]

  def index
    @vaccines = Vaccine.all
  end

  def show
    # .where = vaccine
    @laboratories = Laboratory.geocoded #returns labs with coordinates
    @markers = @laboratories.map do |laboratory|
      if laboratory.category == "private"
        {
          lat: laboratory.latitude,
          lng: laboratory.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory, laboratory_vaccine: LaboratoryVaccine.find_by(laboratory: laboratory, vaccine: @vaccine) }),
          image_url: helpers.asset_url('icon_blue.png')
        }
      else
        {
          lat: laboratory.latitude,
          lng: laboratory.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory }),
          image_url: helpers.asset_url('icon_red.png')
        }
      end
    end
  end

  def vaccinate
    member_vaccine = MemberVaccine.find_by(vaccine: @vaccine, member: @member)
    member_vaccine.vaccinated = !member_vaccine.vaccinated
    appointment = Appointment.find_by(vaccine: @vaccine, member: @member)
    member_vaccine.vaccine_date = appointment.date
    member_vaccine.save!
    if MemberVaccine.find_by(vaccine: appointment.vaccine, member: appointment.member).vaccinated == true
      mail = UserMailer.with(member: @member, vaccine: @vaccine, appointment: appointment, user: current_user).create_confirmation_vaccinate
      mail.deliver_now
    end
    redirect_to @member
  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def set_member
    @member = Member.find(params[:member_id])
  end
end
