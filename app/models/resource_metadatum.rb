class ResourceMetadatum < ApplicationRecord
	has_many :resource_tag
	has_many :tags, :through => :resource_tag

	def self.search(search)
		if search
			resources = ResourceMetadatum.joins(:tags).where('Tag_Title LIKE :search OR
				Author LIKE :search OR 
			   Title LIKE :search OR
			   Abstract LIKE :search', search: "%#{search.downcase}%")
			if resources
				resources
			end
		else
			self.all
		end
	end
end