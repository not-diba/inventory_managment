class AddRoleNameToRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :role_name, :string
  end
end
