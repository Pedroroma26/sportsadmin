class AddClubsValidationstoReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :club_home_validation, :datetime
    add_column :reports, :club_away_validation, :datetime
  end
end
