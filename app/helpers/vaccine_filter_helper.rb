module VaccineFilterHelper
  def vaccine_filter(member)
    age = ((Date.current - member.birth_date).to_f / 365 * 12).round
    Vaccine.where("vaccination_age <= #{age}")
  end
end
