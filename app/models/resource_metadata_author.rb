class Resource_MetadataAuthor < ApplicationRecord
	belongs_to :resource
	belongs_to :author
end
