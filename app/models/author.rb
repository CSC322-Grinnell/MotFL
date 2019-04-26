class Author < ApplicationRecord
	has_many :resource_metadata_author
	has_many :resources, :through => :resource_metadata_author
end