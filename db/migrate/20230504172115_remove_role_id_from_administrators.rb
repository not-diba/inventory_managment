class RemoveRoleIdFromAdministrators < ActiveRecord::Migration[7.0]
  def change
    remove_column :administrators, :role_id, :integer
  end
end
