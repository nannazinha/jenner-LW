require "time"

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i( show edit update destroy show_alert)
  skip_before_action :has_members, only: %i(new create)

  def index
    @members = Member.where(user: current_user)
  end

  def show
  end

  def new
    @member = Member.new
    @member.member_vaccines.build
    @vaccines = []
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user
    if @member.save!
      Vaccine.all.each do |vaccine|
        MemberVaccine.create(member: @member, vaccine: vaccine)
      end
      mail = UserMailer.with(member: @member, user: current_user).create_confirmation_member
      mail.deliver_now
      redirect_to member_path(@member)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    @member.update(member_params)
    redirect_to member_path(@member)
  end

  def destroy
    @member.destroy
    redirect_to members_path
  end

   private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit( :first_name,
                                    :last_name,
                                    :birth_date,
                                    :gender,
                                    :category,
                                    :photo,
                                    member_vaccines_attributes: [ :id,
                                                                  :vaccine_id,
                                                                  :member_id,
                                                                  :vaccine_date,
                                                                  :vaccinated])
  end
end
