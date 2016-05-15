class HospitalsController < ApplicationController
  def index
    if current_hospital
      @patients = current_hospital.patients.sort_by { |patient| patient.patient_score }
    else
      redirect_to "/hospitals/sign_in"
    end
  end
end
