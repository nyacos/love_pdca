require 'bcrypt'

class AdminUser < ApplicationRecord
  has_secure_password

  validates :is_admin, inclusion: { in: [true, false] }
end
