# frozen_string_literal: true

class Administrator < ApplicationRecord
  belongs_to :department
  has_one :role
  has_secure_password
end
