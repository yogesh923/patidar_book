class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :posts, dependent: :destroy
	has_many :attachments, as: :attached_item, dependent: :destroy
	has_many :comments 
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

	# to call all your friends

	def friends
	  active_friends | received_friends
	end

	# to call your pending sent or received

	def pending
	  pending_friends | requested_friendships
	end

	def follow(user)
    Notification.create(notify_type: 'follow', actor: self, user: user)
  end

end
