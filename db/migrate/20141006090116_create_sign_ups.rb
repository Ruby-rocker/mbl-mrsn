class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.string :name
      t.string :company
      t.string :designation
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
