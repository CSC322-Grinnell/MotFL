class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }
    has_and_belongs_to_many :roles
end
