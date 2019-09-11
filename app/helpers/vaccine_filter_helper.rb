module VaccineFilterHelper
  def vaccine_expired(member)
    age = ((Date.current - member.birth_date).to_f / 365 * 12).round
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    Vaccine.where("vaccination_age <= ?", age).where.not(id: vaccine_taken_ids)
  end

  def vaccine_next(member)
    age = ((Date.current - member.birth_date).to_f / 365 * 12).round + 12
    age_next = age + 12
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    expired_vaccines = Vaccine.where("vaccination_age <= ?", age).where.not(id: vaccine_taken_ids)
    Vaccine.where("vaccination_age <= ?", age_next).where.not(id: vaccine_taken_ids).where.not(id: expired_vaccines)
  end

  def vaccine_filter(member)
    vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
    Vaccine.where.not(id: vaccine_taken_ids)
  end

  # def vaccine_taken(member)
  #   vaccine_taken_ids = MemberVaccine.where(member: member, vaccinated: true).pluck(:vaccine_id)
  #   Vaccine.where(id: vaccine_taken_ids)
  # end

  def vaccine_taken(member)
    MemberVaccine.where(member: member, vaccinated: true)
  end

  def vaccine_index
    names = Vaccine.distinct.pluck(:name, :description)
    # Vaccine.where(id: vaccine_taken_ids)
  end
end
