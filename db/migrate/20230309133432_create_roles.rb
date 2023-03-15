class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
