class Post < ApplicationRecord
   belongs_to :user
   has_many :comments, dependent: :delete_all
   mount_uploader :image, AvatarUploader
   validates :content, presence: true, length: {minimum: 5}
   delegate :username, :username=, :email, :email=,:avatar, :avatar=, :to => :user, allow_nil: true

end
