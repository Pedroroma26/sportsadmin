class CreateReportsInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :reports_instances do |t|
      t.string :name
      t.integer :minute
      t.text :motive
      t.references :report, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
