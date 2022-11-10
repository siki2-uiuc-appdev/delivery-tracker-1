# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:deliveries, { :class_name => "Delivery", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:waiting_on, -> { where status: "waiting on" }, { :class_name => "Delivery", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:delivered,  -> { where status: "delivered" }, { :class_name => "Delivery", :foreign_key => "owner_id", :dependent => :destroy })

end
