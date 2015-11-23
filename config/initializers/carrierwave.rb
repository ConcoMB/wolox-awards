# config/initializers/carrierwave.rb

CarrierWave.configure do |config|

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/public"
  else
    amazons3 = AppConfiguration.for(:amazons3)
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: amazons3.key,
      aws_secret_access_key: amazons3.secret,
      region: amazons3.region
    }
    config.storage = :fog
    config.fog_directory = amazons3.bucket_name
  end

  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/public/uploads"

end
