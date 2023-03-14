class AddDeletedAtToCompetitions < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :deleted_at, :datetime
    add_index :competitions, :deleted_at
  end
end
