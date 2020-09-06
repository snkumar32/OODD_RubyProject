class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true, on: :create
    validates :username, uniqueness: true, presence: true, on: :update
end