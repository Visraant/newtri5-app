class Patient < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :check_ins

  def patient_wait
    x = Time.current - created_at
    # @patients = Patient.all
    # @patients.each do |patient|
    #   patient_wait = (Time.current - patient.created_at)
    # end
    (x / 60) * (x / 60)
  end

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
    if reason_for_visit == "Concussion"
      reason_for_visit_score = 9
    elsif reason_for_visit == "Headache"
      reason_for_visit_score = 7
    elsif reason_for_visit == "Carpal Tunnel"
      reason_for_visit_score = 4
    elsif reason_for_visit == "Anxiety"
      reason_for_visit_score = 5
    elsif reason_for_visit == "Vertigo"
      reason_for_visit_score = 7
    elsif reason_for_visit == "Back pain"
      reason_for_visit_score = 9
    else 
      reason_for_visit_score = 3
    end
  end

  # def time_score
  #   time_score = (((Time.current - patient.created_at) / 60) / 60) ^ 2
  # end

  def patient_score
    (patient_score = age_score + gender_score + reason_for_visit_score + patient_wait) / 1000
  end
end
