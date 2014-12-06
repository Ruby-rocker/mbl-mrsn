ActiveAdmin.register SignUp do
  config.batch_actions = false
  actions :all, :except => [:update, :edit]
  config.clear_action_items!
  menu priority: 4

  index do
    selectable_column
    id_column
    column :name
    column :company
    column :designation
    column :email
    column :location
    actions  
  end

  filter :name
  filter :company
end
