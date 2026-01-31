class User < ApplicationRecord
  has_secure_password

  VALID_ALNUM = /\A[a-zA-Z0-9]+\z/

  validates :user_id,
            presence: true,
            uniqueness: true,
            length: { in: 10..20 },
            format: { with: VALID_ALNUM }

  validates :login,
            presence: true,
            length: { in: 10..15 },
            format: { with: VALID_ALNUM }
end