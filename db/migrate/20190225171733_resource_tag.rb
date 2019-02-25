class ResourceTag < ActiveRecord::Migration[5.1]
  def change
  	create_table :resource_tag, index: false do |t|
      t.belongs_to :resource, index: true
      t.belongs_to :tag, index: true
    end
  end
end
