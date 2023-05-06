class RemoveAdministratorIdFromDepartment < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :administrator_id, :integer
  end
end
