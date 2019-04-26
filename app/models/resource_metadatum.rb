class ResourceMetadatum < ApplicationRecord
	has_many :resource_tag
	has_many :tags, :through => :resource_tag
	has_many :resource_metadata_authors
	has_many :authors, :through => :resource_metadata_authors

	def self.search(search)
		if search
			resources = ResourceMetadatum.joins(:tags).joins(:authors).where('Tag_Title LIKE :search OR
				author_name LIKE :search OR 
			   Title LIKE :search OR
			   Abstract LIKE :search', search: "%#{search.downcase}%").distinct
			if resources
				resources
			end
		else
			self.all
		end
	end
end