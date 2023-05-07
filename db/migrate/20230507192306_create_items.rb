class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :administrator_name
      t.string :room_id
      t.string :remarks
      t.integer :quantity
      t.string :unit
      t.string :assigned_to
      t.boolean :returned
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
