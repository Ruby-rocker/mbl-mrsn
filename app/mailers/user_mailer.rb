class UserMailer < ActionMailer::Base
  # default from: "from@example.com"
  def user_added(user, name, emails, email_cc)
  	@file = name
  	@user = user
   	attachments.inline['attachment_file.zip'] = File.read("#{Rails.root}/public/attachments/#{@user.id}/#{@file}")
   	mail :to => emails, :bcc => email_cc, :from => "softwebdemo@gmail.com" ,:subject => "Mersen Information"
  end
  def sign_up(sign_up)
   	@sign_up = sign_up
   	mail :to => @sign_up.email, :from => "softwebdemo@gmail.com" ,:subject => "Sign Up Information"
  end
end
