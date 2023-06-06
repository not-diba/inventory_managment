class Unit < ApplicationRecord
  validates :unit_name,  uniqueness: true, presence: true
end
