class Gallery < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :image, ImageUploader
  # after_update :reprocess_avatar, :if => :cropping?


  after_update :crop_avatar

  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end

  # def cropping?
  #   !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  # end

  # def avatar_geometry(style = :original)
  #   @geometry ||= {}
  #   @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  # end

  # private

  # def reprocess_avatar
  #   avatar.reprocess!
  # end
end
