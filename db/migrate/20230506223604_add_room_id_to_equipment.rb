class AddRoomIdToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :room_id, :integer
  end
end
