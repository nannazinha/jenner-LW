require "time"

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i(show edit update destroy show_alert)

  def index
    @members = Member.where(user: current_user)
    # @member.user_id = user
    # vac = ((Date.current - member.birth_date).to_f / 365 * 12)
    # @vacinnes = MemberVaccine.where("vaccination_age <= #{vac}")
  end

  def show
    @age = ((Date.current - @member.birth_date).to_f / 365 * 12).round
    @vac = Vaccine.where("vaccination_age <= #{@age}")
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

  def show_alert

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
                                    member_vaccines_attributes: [ :id,
                                                                  :vaccine_id,
                                                                  :member_id,
                                                                  :vaccine_date,
                                                                  :vaccinated])
  end
end
