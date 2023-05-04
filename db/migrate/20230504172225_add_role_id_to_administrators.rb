class AddRoleIdToAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :role_id, :integer
  end
end
