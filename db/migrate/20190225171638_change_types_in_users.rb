class ChangeTypesInUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :is_deleted, :boolean
  end
  def down
    change_column :users, :is_deleted, :string
  end
end
