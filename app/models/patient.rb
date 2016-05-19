class Patient < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :check_ins

  def patient_wait
    if ((Time.current - created_at) / 60) < 5
      patient_wait = 0
    elsif ((Time.current - created_at) / 60) >= 5 && ((Time.current - created_at) / 60) < 10
      patient_wait = 1
    elsif ((Time.current - created_at) / 60) >= 10 && ((Time.current - created_at) / 60) < 20
      patient_wait = 2
    elsif ((Time.current - created_at) / 60) >= 20 && ((Time.current - created_at) / 60) < 30
      patient_wait = 5
    elsif ((Time.current - created_at) / 60) >= 30 && ((Time.current - created_at) / 60) < 45
      patient_wait = 10
    elsif ((Time.current - created_at) / 60) >= 45 && ((Time.current - created_at) / 60) < 60
      patient_wait = 20
    elsif ((Time.current - created_at) / 60) >= 60
      patient_wait = 40
    end
  end

  def age_score
    if birthdate <= "01/01/1951" || birthdate >= "01/01/2011"
      age_score = 10
    elsif birthdate < "01/01/2011" && birthdate >= "01/01/1998"
      age_score = 5
    elsif birthdate < "01/01/1998" && birthdate > "01/01/1951"
      age_score = 3
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
    if reason_for_visit == "Cold"
      reason_for_visit_score = 1
    elsif reason_for_visit == "Tired"
      reason_for_visit_score = 1
    elsif reason_for_visit == "Cough"
      reason_for_visit_score = 2
    elsif reason_for_visit == "Headache"
      reason_for_visit_score = 3
    elsif reason_for_visit == "Anxiety"
      reason_for_visit_score = 3
    elsif reason_for_visit == "Stomach ache"
      reason_for_visit_score = 4
    elsif reason_for_visit == "Dizziness"
      reason_for_visit_score = 5
    elsif reason_for_visit == "Sprain"
      reason_for_visit_score = 5
    elsif reason_for_visit == "Bleeding"
      reason_for_visit_score = 6
    elsif reason_for_visit == "Hacking cough"
      reason_for_visit_score = 7
    elsif reason_for_visit == "Fever"
      reason_for_visit_score = 8
    elsif reason_for_visit == "High fever"
      reason_for_visit_score = 9
    elsif reason_for_visit == "Broken bone"
      reason_for_visit_score = 10
    elsif reason_for_visit == "Heavy bleeding"
      reason_for_visit_score = 11
    elsif reason_for_visit == "Stabbed"
      reason_for_visit_score = 15
    else 
      reason_for_visit_score = 5
    end
  end

  # def time_score
  #   time_score = (((Time.current - patient.created_at) / 60) / 60) ^ 2
  # end

  def patient_score
    (patient_score = age_score + gender_score + reason_for_visit_score + patient_wait)
  end
end
