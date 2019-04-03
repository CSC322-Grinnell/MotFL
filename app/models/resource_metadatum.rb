class ResourceMetadatum < ApplicationRecord
	has_many :resource_tag
	has_many :tags, :through => :resource_tag

	def self.search(search)
		if search
			resources = ResourceMetadatum.joins(:tags).find_by(Tag_Title: search)
			if resources
				resources
			end
		else
			self.all
		end
	end
end