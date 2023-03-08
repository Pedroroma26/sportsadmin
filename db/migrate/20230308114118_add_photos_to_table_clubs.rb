class AddPhotosToTableClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :photo, :string
  end
end
