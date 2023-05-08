class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :department_id, presence: true
end
