class Changedatatypetostarttime < ActiveRecord::Migration
  def up
  	change_column :users, :start_time, :string
  end

  def down
  	change_column :users, :start_time, :datetime 	
  end
end
