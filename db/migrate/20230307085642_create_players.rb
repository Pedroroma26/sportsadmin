class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :player_number
      t.date :birth_date
      t.string :gender
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
