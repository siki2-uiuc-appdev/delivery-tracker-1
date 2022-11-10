# == Schema Information
#
# Table name: deliveries
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  description  :string
#  details      :text
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#
class Delivery < ApplicationRecord
  
  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })
end
