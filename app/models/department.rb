# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :labs
  has_many :rooms

  validates :department_name, presence: true
end
