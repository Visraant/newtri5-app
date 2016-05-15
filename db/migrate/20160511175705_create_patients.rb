class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :birthdate
      t.string :reason_for_visit

      t.timestamps null: false
    end
  end
end
