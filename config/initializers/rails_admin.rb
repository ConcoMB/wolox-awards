RailsAdmin.config do |config|

  config.main_app_name = ['Wolox Awards', 'BackOffice']
  config.included_models = ['User', 'Category', 'Voter', 'Vote', 'Nominee']

  config.authenticate_with do
    warden.authenticate! scope: :backoffice_administrator
  end
  config.current_user_method(&:current_backoffice_administrator)


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
  Rails.application.eager_load! if Rails.env.development?
    ActiveRecord::Base.descendants.each do |imodel|
      config.model "#{imodel.name}" do
        list do
          exclude_fields :created_at, :updated_at
        end
      end
    end

    config.model 'User' do
      object_label_method do
        :email
      end
      [list, show].each do
        exclude_fields :encrypted_password, :reset_password_token, :reset_password_sent_at,
                       :remember_created_at, :sign_in_count, :current_sign_in_at,
                       :current_sign_in_ip, :last_sign_in_ip, :last_sign_in_at,
                       :created_at, :updated_at, :confirmation_token, :confirmation_sent_at,
                       :session_authentication_token, :confirmed_at
    end
  end
end
