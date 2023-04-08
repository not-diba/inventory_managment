# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :labs
  has_many :administrators

  validates :department_name, presence: true
end
