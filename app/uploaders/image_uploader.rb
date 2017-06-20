class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [Settings.resize_to_fit_width, Settings.resize_to_fit_height]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def default_url *args
    [version_name, "no_image.jpg"].compact.join("_")
  end
end
