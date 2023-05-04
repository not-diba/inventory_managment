class AddLocationToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :location, :string
  end
end
