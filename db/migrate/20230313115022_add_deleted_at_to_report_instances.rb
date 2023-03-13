class AddDeletedAtToReportInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :report_instances, :deleted_at, :datetime
    add_index :report_instances, :deleted_at
  end
end
