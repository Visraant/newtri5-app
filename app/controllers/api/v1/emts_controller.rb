class Api::V1::EmtsController < ApplicationController
  def index
    emts = Emt.all.map do |emt|
      {
        id: emt.id,
        coordinates: Geocoder.coordinates(emt.patient_address),
        emt_name: emt.emt_name,
        phone_number: emt.emt_phone_number,
        patient_name: emt.patient_name,
        patient_gender: emt.patient_gender,
        patient_age: emt.patient_age,
        patient_symptoms: emt.patient_symptoms,
        patient_conditions: emt.patient_condition,
        patient_address: emt.patient_address 
      }
    end
    render json: emts
  end
end
