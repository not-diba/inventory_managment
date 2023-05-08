class AddAdministratorIdToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :administrator_id, :integer
  end
end
