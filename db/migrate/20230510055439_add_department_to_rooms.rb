class AddDepartmentToRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :department_id, :integer
    add_reference :rooms, :department, null: false, foreign_key: true
  end
end
