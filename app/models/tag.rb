class Tag < ApplicationRecord
	has_many :resource_tag
	has_many :resources, :through => :resource_tag
end