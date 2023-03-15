# frozen_string_literal: true

class Lab < ApplicationRecord
  belongs_to :department
  has_many :equipment
end
