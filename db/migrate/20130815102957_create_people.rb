class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.boolean :owner

      t.timestamps
    end
  end
end
