class MemberVaccinesController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
    @member = @appointment.member
    @vaccine = @appointment.vaccine
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@member.first_name} #{@member.last_name} - #{@vaccine.name} - #{@appointment.date.strftime('%Y%m%d')}",
        template: "../views/member_vaccines/show.pdf.erb",
        page_size: 'A4',
        layout: "../views/layouts/pdf.html.erb",
        show_as_html: params[:debug].present?
      end
    end
  end


end
