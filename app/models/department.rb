# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :labs, dependent: :destroy
  has_many :administrators, dependent: :destroy
  has_many :rooms, dependent: :destroy

  validates :department_name, presence: true
end
