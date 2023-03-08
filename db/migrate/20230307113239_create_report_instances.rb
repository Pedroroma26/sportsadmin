class CreateReportInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :report_instances do |t|
      t.string :category
      t.integer :minute
      t.text :motive
      t.references :report, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
