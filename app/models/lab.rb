# frozen_string_literal: true

class Lab < ApplicationRecord
  belongs_to :department
  has_many :equipment
  has_many :components
  has_many :rooms
  has_many :items

  validates :lab_name, presence: true
  validates :administrator_id, presence: true
end
