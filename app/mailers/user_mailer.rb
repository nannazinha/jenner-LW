class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bem-vinda(o) ao Jenner!')
    # This will render a view in `app/views/user_mailer`!
  end

  def create_confirmation_member
    @user = params[:user] # Instance variable => available in view
    @member = params[:member]

    mail(
      to:       @member.user.email,
      subject:  "Membro #{@member.first_name} #{@member.last_name} criado!"
    )
  end

  def update_confirmation_member
    @user = params[:user] # Instance variable => available in view
    @member = params[:member]

    mail(
      to:       @member.user.email,
      subject:  "Dados do membro #{@member.first_name} #{@member.last_name} atualizados!"
    )
  end

  def destroy_confirmation_member
    @user = params[:user] # Instance variable => available in view
    @member = params[:member]

    mail(
      to:       @member.user.email,
      subject:  "Membro #{@member.first_name} #{@member.last_name} deletado!"
    )
  end

  def create_confirmation_appointment
    @user = params[:user] # Instance variable => available in view
    @appointment = params[:appointment]

    mail(
      to:       @appointment.member.user.email,
      subject:  "Agendamento ##{@appointment.id} confirmado!"
    )
  end

  def create_confirmation_vaccinate
    @user = params[:user] # Instance variable => available in view
    @member = params[:member]
    @vaccine = params[:vaccine]
    @appointment = params[:appointment]

    mail(
      to:       @member.user.email,
      subject:  "Certificação de vacina #{@vaccine.name}"
    )
  end
end
