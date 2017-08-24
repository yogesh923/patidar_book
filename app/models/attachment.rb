class Attachment < ApplicationRecord
	
	belongs_to :attached_item, polymorphic: true

  mount_uploader :image, ImageUploader

  validates_presence_of :image
  validates_integrity_of :image

  delegate :url, :size, :path, to: :attachment

  alias_attribute :filename, :original_filename

  before_save :update_attachment_attributes

  private
  
  def update_attachment_attributes
    if image.present? && image_changed?
      self.original_filename = image.file.original_filename
      self.content_type = image.file.content_type
    end
  end
end
