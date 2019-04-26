class MultipleAuthorsPerResource < ActiveRecord::Migration[5.1]
  def change
  	create_table :authors do |t|
  		t.string :author_name
  	end

  	create_table :resource_metadata_authors, :id => false do |t|
      t.belongs_to :resource_metadatum_id, index: true
      t.belongs_to :author_id, index: true
    end
  end
end
