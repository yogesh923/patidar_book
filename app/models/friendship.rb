class Friendship < ApplicationRecord
	belongs_to :user
  belongs_to :friend, class_name: "User"


  def accepted!
  	self.update(accepted: true)
  end
  
end
