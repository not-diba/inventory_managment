class AddDepartmentIdToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :department_id, :integer
  end
end
