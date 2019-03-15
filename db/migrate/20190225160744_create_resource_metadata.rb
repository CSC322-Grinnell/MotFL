class CreateResourceMetadata < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_metadata do |t|
      t.string :Title
      t.string :Author
      t.date :publish_date
      t.string :Abstract
      t.string :Link

      t.timestamps
    end
  end
end
