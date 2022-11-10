# == Schema Information
#
# Table name: deliveries
#
#  id           :integer          not null, primary key
#  arrival_date :datetime
#  description  :string
#  details      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#
class Delivery < ApplicationRecord
end
