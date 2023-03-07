class AddDefaultValueToReports < ActiveRecord::Migration[7.0]
  def change
    change_column :reports, :referee_validation, :boolean, default: false
  end
end
