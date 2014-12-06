class CreateCsvFileData < ActiveRecord::Migration
  def change
    create_table :csv_file_data do |t|
      t.string :name
      t.string :company
      t.string :designation
      t.string :email
      t.string :location
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
