ActiveAdmin.register User do
  config.batch_actions = false
  actions :all, :except => [:update, :edit]
  config.clear_action_items!
  menu priority: 3

  member_action :download, :method => :get do
    @user_id = params[:id]
    @user = User.find(params[:id])
    send_file "#{Rails.root}/public/attachments/#{@user_id}/#{@user.folder_name}"
  end


  index do
    selectable_column
    id_column
    column :emergency_key
    column :no_of_brushes_needed
    column :phone
    column :email
    column :start_time
    column :time_zone
    actions  defaults: :true do |user|
      @user = User.find(user)
      if @user.folder_name.present?
        link_to('Download', download_admin_user_path(user), class: "member_link", method: :get , confirm: 'Are you sure want to Download?') 
      end
    end
    #actions  
    
  end

  filter :emergency_key
  filter :phone

end
