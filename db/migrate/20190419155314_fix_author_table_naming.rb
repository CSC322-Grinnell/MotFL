class FixAuthorTableNaming < ActiveRecord::Migration[5.1]
  def change
  	rename_column :resource_metadata_authors, :resource_metadatum_id_id, :resource_metadatum_id
  	rename_column :resource_metadata_authors, :author_id_id, :author_id
  end
end
