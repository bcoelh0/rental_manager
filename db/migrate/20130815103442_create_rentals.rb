class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :person_id
      t.integer :house_id
      t.date :start_date
      t.date :end_date
      t.text :notes

      t.timestamps
    end
  end
end
