class resource_metadatum_author < ApplicationRecord
	belongs_to :resource
	belongs_to :author
end
