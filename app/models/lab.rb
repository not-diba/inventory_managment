# frozen_string_literal: true

class Lab < ApplicationRecord
  belongs_to :department
  has_many :equipment, dependent: :destroy
  has_many :components, dependent: :destroy
  has_many :rooms
  has_many :items, dependent: :destroy

  validates :lab_name, presence: true
  validates :administrator_id, presence: true
end
