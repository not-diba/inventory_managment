class AddRoomIdAndRemarksToComponents < ActiveRecord::Migration[7.0]
  def change
    add_column :components, :room_id, :integer
    add_column :components, :remarks, :text
  end
end
