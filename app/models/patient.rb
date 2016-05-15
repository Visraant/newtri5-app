class Patient < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :check_ins

  # def patient_wait
  #   @patients = Patient.all
  #   @patients.each do |patient|
  #     patient_wait = (Time.current - patient.created_at)
  #   end
  # end

  def age_score
    if birthdate <= "01/01/1951" || birthdate >= "01/01/2011"
      age_score = 20
    elsif birthdate < "01/01/2011" && birthdate >= "01/01/1998"
      age_score = 15
    elsif birthdate < "01/01/1998" && birthdate > "01/01/1951"
      age_score = 10
    end
  end

  def gender_score
    if gender == "F"
      gender_score = 5
    elsif gender == "M"
      gender_score = 4
    end
  end

  def reason_for_visit_score
    if reason_for_visit == "Stabbed"
      reason_for_visit_score = 50
    elsif reason_for_visit == "Cough"
      reason_for_visit_score = 5
    elsif reason_for_visit == "Bruise"
      reason_for_visit_score = 10
    elsif reason_for_visit == "Broken bone"
      reason_for_visit_score = 40
    elsif reason_for_visit == "Stomach ache"
      reason_for_visit_score = 30
    elsif reason_for_visit == "Fever"
      reason_for_visit_score = 35
    elsif reason_for_visit == "Heavy bleeding"
      reason_for_visit_score = 45
    elsif reason_for_visit == "Drawn and quartered"
      reason_for_visit_score = 50
    elsif reason_for_visit == "Turned into a Horcrux"
      reason_for_visit_score = 40
    elsif reason_for_visit == "Fell down a canyon"
      reason_for_visit_score = 45
    else 
      reason_for_visit_score = 25
    end
  end

  # def time_score
  #   time_score = (((Time.current - patient.created_at) / 60) / 60) ^ 2
  # end

  def patient_score
    patient_score = age_score + gender_score + reason_for_visit_score
  end
end
