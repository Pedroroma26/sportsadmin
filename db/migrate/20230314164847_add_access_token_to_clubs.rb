class AddAccessTokenToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :access_token, :string
  end
end
