class Item < ApplicationRecord
  belongs_to :lab

  validates :item_name, presence: true
  validates :administrator_name, presence: true
  validates :room_id, presence: true
  validates :assigned_to, presence: true
  validates :lab_id, presence: true
  validates :unit, presence: true
end
