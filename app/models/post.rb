class Post < ApplicationRecord
	
	belongs_to :user
	
	has_many :comments, dependent: :destroy
	has_many :attachments, as: :attached_item, dependent: :destroy

end
