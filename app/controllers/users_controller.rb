class UsersController < ApplicationController

	def get_user_data
		@user = User.create(:emergency_key => params[:emergency_key],
                        :no_of_brushes_needed => params[:no_of_brushes_needed],
                        :phone => params[:phone], :email => params[:email],
                        :start_time => params[:start_time], :time_zone => params[:time_zone],
                        :comments => params[:comments])
		if @user.save
			render :json => {:status => "Success"}
		else
			render :json => {:status => "Failure"}
		end
  end

	def get_pdf_file
		system "curl -O #{params[:file]}"
	  if true
	    render :json => {:status => "Success"}
	  else
	    render :json => {:status => "Failure"}
	  end
  end

	def get_csv_file
		system "curl -O #{params[:file]}"
		name = File.basename(params[:file])
		csv_text = File.read(name)
    
    CSV.parse(csv_text, headers: true) do |row|
      @csv_file_data = CsvFileData.create(name: row[1], company: row[2], designation: row[3], email: row[4], location: row[5], question: row[6], answer: [7])
   	end

	  if @csv_file_data
	  	render :json => {:status => "Success"}
	  else
	  	render :json => {:status => "Failure"}
	  end
  end
  def save_data
    @name = "#{(Time.now.to_i.to_s)}.zip"
  	@user = User.create(:emergency_key => params[:emergency_key],
                        :no_of_brushes_needed => params[:no_of_brushes_needed],
                        :phone => params[:phone], :email => params[:email],
                        :start_time => params[:start_time], :time_zone => params[:time_zone],
                        :comments => params[:comments], :folder_name => @name)
    @emails = params[:list_of_emails]
    @email_cc = params[:email_cc] 
    if params[:file].present?
      @incoming_file = params[:file]
      Dir.mkdir("#{Rails.root}/public/attachments/#{@user.id}")
      open("#{Rails.root}/public/attachments/#{@user.id}/" + "#{@name}", "wb") do |file|
        file << @incoming_file.read
        #file << open(params[:file]).read
      end
      UserMailer.user_added(@user, @name, @emails, @email_cc).deliver
    end
    respond_to do |format|
      if @user
        
        format.json { render :json => {:status => "Success"} }
      else
        
        format.json { render :json => {:status => "Failure"} }
      end
    end
  
  end
  def sign_up
    @sign_up = SignUp.create(:name => params[:name], :company => params[:company], :designation => params[:designation], :email => params[:email], :location => params[:location])
    respond_to do |format|
      if @sign_up
        UserMailer.sign_up(@sign_up).deliver
        format.json { render :json => {:status => "Success"} }
      else
          
        format.json { render :json => {:status => "Failure"} }
      end
    end
  end

	def index
		@users = User.all
		@save_pdf_files = SavePdfFile.all
		@csv_file_data = CsvFileData.all
	end
end
