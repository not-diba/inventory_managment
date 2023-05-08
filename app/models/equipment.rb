class Equipment < ApplicationRecord
  belongs_to :lab
  validates :equipment_name, presence: true
  validates :room_id, presence: true
  validates :serial_number, presence: true
  validates :model_number, presence: true
end
