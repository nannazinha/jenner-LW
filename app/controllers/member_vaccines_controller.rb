class MemberVaccinesController < ApplicationController
  before_action :set_vaccine, only: [:show, :vaccinate]
  before_action :set_member, only: [:show, :vaccinate]

  def show
    @appointment = Appointment.find_by(vaccine: @vaccine, member: @member)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
        template: "../views/member_vaccines/show.pdf.erb",
        layout: "../views/layouts/pdf.html.erb",
        show_as_html: params[:debug].present?
      end
    end
  end

  def save

  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
