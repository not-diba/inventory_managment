class AddUnitIdToComponents < ActiveRecord::Migration[7.0]
  def change
    remove_column :components, :unit, :string
    add_column :components, :unit_id, :integer
  end
end
