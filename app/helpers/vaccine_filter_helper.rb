module VaccineFilterHelper
  def vaccine_filter(member)
    age = ((Date.current - member.birth_date).to_f / 365 * 12).round
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    Vaccine.where("vaccination_age <= ?", age).where.not(id: vaccine_taken_ids)
  end

  def vaccine_expired(member)
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    Vaccine.where.not(id: vaccine_taken_ids)
  end

  def vaccine_taken(member)
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    Vaccine.where(id: vaccine_taken_ids)
  end
end
