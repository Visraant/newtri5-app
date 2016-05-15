class AddPatientScoreToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :patient_score, :integer
  end
end
