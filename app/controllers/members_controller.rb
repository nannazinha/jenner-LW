require "time"

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i(show edit update destroy)

  def index
    @members = Member.where(user: current_user)
  end

  def show; end

  def new
    @member = Member.new
    @member.member_vaccines.build
    @vaccines = []
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user
    if @member.save!
      redirect_to member_path(@member)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
    @member.member_vaccines.build
    today = Date.current
    age = ((today - @member.birth_date).to_f / 365 * 12).round + 12
    @vaccines = Vaccine.where("vaccination_age <= #{age}")
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
    params.require(:member).permit(:first_name, :last_name, :birth_date, :gender, :category,
      member_vaccines_attributes: [:vaccine_id, :vaccine, :member_id, :vaccine_date, :vaccinated])
  end
end
