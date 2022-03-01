# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  sent_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vehicle_id :integer
#
class Location < ApplicationRecord
  belongs_to :vehicle
end
