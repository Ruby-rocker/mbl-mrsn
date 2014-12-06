class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :emergency_key
      t.integer :no_of_brushes_needed
      t.integer :phone
      t.string :email
      t.datetime :start_time
      t.string :time_zone
      t.text :comments

      t.timestamps
    end
  end
end
