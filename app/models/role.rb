# frozen_string_literal: true

class Role < ApplicationRecord
  validates :role_name, presence: true
end
