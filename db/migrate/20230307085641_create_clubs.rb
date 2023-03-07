class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :abreviation
      t.string :address
      t.string :email
      t.string :phone_number
      
      t.timestamps
    end
  end
end
