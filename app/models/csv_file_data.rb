class CsvFileData < ActiveRecord::Base

	def self.import_csv(file)
    csv_text = File.read(file)
    
    CSV.parse(csv_text, headers: true) do |row|
      @csv_file_data = CsvFileData.create(name: row[1], company: row[2], designation: row[3], email: row[4], location: row[5], question: row[6], answer: [7])
   	end
   	redirect_to users_path
  end

end
