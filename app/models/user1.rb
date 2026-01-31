class User < ApplicationRecord
    validates :user_id, presence: true, length: { in: 10..20 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :login, presence: true, length: { in: 10..15 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
     has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
