class EmtsController < ApplicationController
  def new
    @emts = Emt.all
    @emt = Emt.new
    @hospitals = Hospital.all
  end

  def create
    @hospitals = Hospital.all
    @emt = Emt.new(
      emt_name: params[:emt_name],
      emt_phone_number: params[:emt_phone_number],
      patient_name: params[:patient_name],
      patient_gender: params[:patient_gender],
      patient_age: params[:patient_age],
      patient_symptoms: params[:patient_symptoms],
      patient_condition: params[:patient_condition],
      patient_address: params[:patient_address],
      hospital_id: params[:hospital][:hospital_id]
    )
  end
end
