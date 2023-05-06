class AddAdministratorIdToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :administrator_id, :integer
  end
end
