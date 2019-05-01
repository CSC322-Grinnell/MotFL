class FixResourceTagConvention < ActiveRecord::Migration[5.1]
  def change
  	rename_column :resource_tags, :resource_id, :resource_metadatum_id
  end
end
