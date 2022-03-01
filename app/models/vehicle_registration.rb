# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicle_registrations
#
#  id         :bigint           not null, primary key
#  uuid       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class VehicleRegistration < ApplicationRecord
  acts_as_paranoid

  validates :uuid, presence: true

  validates_as_paranoid
  validates_uniqueness_of_without_deleted :uuid

  has_many :locations
end
