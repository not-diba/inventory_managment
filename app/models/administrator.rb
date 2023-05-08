# frozen_string_literal: true

class Administrator < ApplicationRecord
  belongs_to :department
  has_one :role
  has_secure_password

  validates :name, length: { minimum: 4 }, presence: true
  validates :email, uniqueness: true, presence: true
  validates :role_id, presence: true
  validates :department_id, presence: true
end
