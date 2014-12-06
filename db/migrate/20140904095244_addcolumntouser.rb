class Addcolumntouser < ActiveRecord::Migration
  def change
  	add_column :users, :folder_name, :string
  end
end
