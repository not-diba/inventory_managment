class Room < ApplicationRecord
  belongs_to :department
  has_many :equipment
end
