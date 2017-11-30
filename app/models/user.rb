class User < ApplicationRecord
  has_secure_password

  enum role: { user: 0, user_manager: 1, admin: 2 }

  validates_presence_of :name, :email, :role

  has_many :time_zones
end
