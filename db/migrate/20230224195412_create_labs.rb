class CreateLabs < ActiveRecord::Migration[7.0]
  def change
    create_table :labs do |t|
      t.string :lab_name
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
