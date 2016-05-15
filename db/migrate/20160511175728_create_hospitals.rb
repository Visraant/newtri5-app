class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :capacity
      t.string :trauma_level

      t.timestamps null: false
    end
  end
end
