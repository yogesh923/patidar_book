class AddImageToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :image, :string
    add_column :attachments, :attached_item_id, :integer
    add_column :attachments, :attached_item_type, :string
    add_column :attachments, :original_filename, :string
    add_column :attachments, :content_type, :string
  end
end
