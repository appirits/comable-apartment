# TODO: ImageUploader => Comable::ImageUploader
ImageUploader.class_eval do
  # OVERRIDE: store_dir with tenant
  def store_dir
    "uploads/#{::Apartment::Tenant.current}/#{model.class.to_s.underscore}/#{model.id}"
  end
end
