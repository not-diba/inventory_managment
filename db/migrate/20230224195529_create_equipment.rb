class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :equipment_name
      t.string :make
      t.string :serial_number
      t.string :model_number
      t.string :status
      t.text :remarks
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
