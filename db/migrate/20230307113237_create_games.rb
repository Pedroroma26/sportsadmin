class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :competition, null: false, foreign_key: true
      t.references :club_home, null: false, foreign_key: { to_table: :clubs }
      t.references :club_away, null: false, foreign_key: { to_table: :clubs }
      t.references :referee, null: false, foreign_key: { to_table: :users }
      t.datetime :game_date

      t.timestamps
    end
  end
end
