class Resource_Tag < ApplicationRecord
	belongs_to :resource
	belongs_to :tag
end
