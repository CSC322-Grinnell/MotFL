class Author < ApplicationRecord
	has_many :ResourceMetadataAuthor
	has_many :resources, :through => :ResourceMetadataAuthor
end