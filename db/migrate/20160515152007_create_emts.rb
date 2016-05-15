class CreateEmts < ActiveRecord::Migration
  def change
    create_table :emts do |t|
      t.string :emt_name
      t.string :emt_phone_number
      t.string :patient_name
      t.string :patient_gender
      t.string :patient_age
      t.string :patient_symptoms
      t.string :patient_condition
      t.string :patient_address

      t.timestamps null: false
    end
  end
end
