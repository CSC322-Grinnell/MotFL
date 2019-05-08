class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }
    has_and_belongs_to_many :roles
    
    #generates admin? and volunteer? methods for permission checking
    [:admin, :volunteer].each do |role|
        define_method("#{role}?") { roles.exists?(name: role) }
    end
    
    def has_role?(role_name)
        roles.any? { |role| role.name == role_name }
    end
end
