# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id                      :bigint           not null, primary key
#  latitude                :decimal(, )
#  longitude               :decimal(, )
#  sent_at                 :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  vehicle_registration_id :integer
#
class Location < ApplicationRecord
  belongs_to :vehicle_registration

  def broadcast_attributes
    {
      latitude:,
      longitude:,
      vehicle_registration_id:,
      sent_at:
    }
  end
end
