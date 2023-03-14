class AddDeletedAtToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :deleted_at, :datetime
    add_index :clubs, :deleted_at
  end
end
