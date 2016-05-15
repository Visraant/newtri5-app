class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @patients = Patient.order(sort => sort_order)
    end
  end

  def new
    @patient = Patient.new
    @hospitals = Hospital.all
  end

  def create
    @hospitals = Hospital.all
    @patient = Patient.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      gender: params[:gender],
      birthdate: params[:birthdate],
      reason_for_visit: params[:reason_for_visit],
      hospital_id: params[:hospital][:hospital_id]
    )
    if @patient.save
      flash[:success] = "You successfully checked in!"
      redirect_to "/patients/new"
    end
  end
end
