class ResourceMetadatum < ApplicationRecord
	has_many :resource_tag
	has_many :tags, :through => :resource_tag
	has_many :resource_metadata_authors
	has_many :authors, :through => :resource_metadata_authors

	def self.search(search)
		if search != ''
			sql = "SELECT resource_metadata.id, Title, GROUP_CONCAT(authors.author_name) as authors, publish_date, Abstract, Link 
					FROM resource_metadata 
					LEFT JOIN resource_metadata_authors ON resource_metadata_authors.resource_metadatum_id = resource_metadata.id 
					LEFT JOIN authors ON resource_metadata_authors.author_id = authors.id
					LEFT JOIN resource_tags ON resource_tags.resource_metadatum_id = resource_metadata.id
					LEFT JOIN tags ON tags.id = resource_tags.tag_id
					WHERE Tag_Title LIKE '#{search}' OR
								author_name LIKE '#{search}' OR 
			   				Title LIKE '#{search}' OR
			   				Abstract LIKE '#{search}'
					GROUP BY resource_metadata.id"
			resources_hash_data = ActiveRecord::Base.connection.execute(sql)
		else
			resources_hash_data = ActiveRecord::Base.connection.execute("SELECT resource_metadata.id, Title, GROUP_CONCAT(authors.author_name) as authors, publish_date, Abstract, Link 
					FROM resource_metadata 
					LEFT JOIN resource_metadata_authors ON resource_metadata_authors.resource_metadatum_id = resource_metadata.id 
					LEFT JOIN authors ON resource_metadata_authors.author_id = authors.id
					GROUP BY resource_metadata.id")
		end
	end

	def self.prepare_display()
		authors = ResourceMetadatum
		.select("id, Title, GROUP_CONCAT(self.author) as authors, publish_date, Abstract, Link")
		.joins(:authors)
		.group("authors")
	end
end