class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_fit: [200, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/defaults/#{model.class.to_s.underscore}/#{mounted_as}_default.jpg"
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end
end
