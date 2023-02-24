class Equipment < ApplicationRecord
  belongs_to :lab
  belongs_to :room
end
