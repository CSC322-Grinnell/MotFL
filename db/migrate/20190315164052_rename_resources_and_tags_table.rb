class RenameResourcesAndTagsTable < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :resource_tag, :resource_tags
  end

  def self.down
    rename_table :resource_tag, :resource_tags
  end
end
