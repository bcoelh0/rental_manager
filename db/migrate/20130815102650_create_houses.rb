class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.string :type
      t.integer :person_id
      t.timestamps
    end
  end
end
