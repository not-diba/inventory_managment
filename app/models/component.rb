class Component < ApplicationRecord
  belongs_to :lab
  validates :component_name, presence: true
  validates :room_id, presence: true
  validates :unit_id, presence: true
end
