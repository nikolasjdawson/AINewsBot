class PostImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
