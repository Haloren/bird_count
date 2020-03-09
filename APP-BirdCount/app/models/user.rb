class User < ActiveRecord::Base
    has_many :guides
    validates :username, :email, presence: true
    has_secure_password
end