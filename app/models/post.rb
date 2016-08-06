class Post < ApplicationRecord
   belongs_to :user, required: true
   mount_uploader :image, AvatarUploader
   validates :content, presence: true, length: {minimum: 5}


end
