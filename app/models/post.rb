class Post < ApplicationRecord
  belongs_to :users
  belongs_to :walls
  has_many :comments
end
