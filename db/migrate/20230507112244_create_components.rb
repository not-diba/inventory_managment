class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :component_name
      t.integer :quantity
      t.string :unit
      t.boolean :returnable
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
