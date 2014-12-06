Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  

  resources :users
  post 'get_user_data' => 'users#get_user_data', as: :get_user_data, format: :json
  post 'get_pdf_file' => 'users#get_pdf_file', as: :get_pdf_file, format: :json
  post 'get_csv_file' => 'users#get_csv_file', as: :get_csv_file, format: :json

  post 'save_data' => 'users#save_data', as: :save_data, format: :json
  post 'sign_up' => 'users#sign_up', as: :sign_up, format: :json
  root 'welcome#index'
 
end
