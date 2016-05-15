class AddPatientScoreToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :patient_score, :integer
  end
end
