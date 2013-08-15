class ChangesHouseTypeName < ActiveRecord::Migration
  def change
    rename_column :houses, :type, :category
  end
end
