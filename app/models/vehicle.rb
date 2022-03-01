# frozen_string_literal: true

class Vehicle < ApplicationRecord
  acts_as_paranoid

  has_many :locations
end
