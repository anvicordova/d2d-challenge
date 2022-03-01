# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  uuid       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Vehicle < ApplicationRecord
  acts_as_paranoid

  has_many :locations
end
