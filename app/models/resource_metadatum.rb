class ResourceMetadatum < ApplicationRecord
	has_many :resource_tag
	has_many :tags, :through => :resource_tag
end
