class User < ApplicationRecord
    has_many :lists
    has_many :todos, through: :lists 

    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password_confirmation, presence: true, on: :create
end
