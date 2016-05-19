class HospitalsController < ApplicationController
  def index
    if current_hospital
      @patients = current_hospital.patients.sort_by { |patient| patient.patient_score }.reverse!
    else
      redirect_to "/hospitals/sign_in"
    end
  end

  def show
    # if current_hospital
    #   @patients = current_hospital.patients.sort_by { |patient| patient.patient_score }.reverse!
    # else
    #   redirect_to "/hospitals/sign_in"
    # end
  end

  def checkins
    @patients = Patient.all
    @patients.each do |patient|
      if current_hospital && patient.status = "Checked In"
        @patients = current_hospital.patients.sort_by { |patient| patient.patient_score }.reverse!
      else
        redirect_to "/hospitals/sign_in"
      end
    end
  end
end
