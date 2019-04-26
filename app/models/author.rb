class Author < ApplicationRecord
	has_many :Resource_MetadataAuthor
	has_many :resources, :through => :Resource_MetadataAuthor
end