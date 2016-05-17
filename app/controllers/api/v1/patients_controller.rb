class Api::V1::PatientsController < ApplicationController
  def index
    @patients = current_hospital.patients.where(status: "Waiting")
    render json: @patients
  end

  def check_in
    @patient = Patient.find(params[:id])
    if @patient.update(status: "Checked In")
      render json: @patient
    else
      render json: @patient
    end
  end
end
