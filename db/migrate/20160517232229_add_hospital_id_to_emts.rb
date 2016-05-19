class AddHospitalIdToEmts < ActiveRecord::Migration
  def change
    add_column :emts, :hospital_id, :integer
  end
end
