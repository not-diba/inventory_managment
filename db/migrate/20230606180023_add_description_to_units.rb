class AddDescriptionToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :description, :string
  end
end
