class Room < ApplicationRecord
  belongs_to :department
  validates :room_name, presence: true
  validates :department_id, presence: true
end
