class Changedatabasetousers < ActiveRecord::Migration
  def up
  	change_column :users, :emergency_key, :string
  end

  def down
  	change_column :users, :emergency_key, :integer
  end
end
