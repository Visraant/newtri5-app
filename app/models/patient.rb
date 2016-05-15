class Patient < ActiveRecord::Base
  belongs_to :hospital

  def patient_wait
    @patients.each do |patient|
      patient_wait = (Time.current - patient.updated_at)
    end
  end

  def patient_score
    if reason_for_visit == "Stabbed"
      patient_score = 2
    elsif reason_for_visit == "bow and arrow accident"
      patient_score = 1
    end
  end
end
