ActiveAdmin.register CsvFileData do
config.batch_actions = false
actions :all, :except => [:destroy, :update, :edit]
config.clear_action_items!
menu priority: 2
  index do
    selectable_column
    id_column
    column :name
    column :company
    column :designation
    column :email
    column :location
    column :question
    column :answer
    actions
  end

  filter :name
  filter :email
end
