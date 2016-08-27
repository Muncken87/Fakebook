class Wall < ApplicationRecord
  has_many :posts
  has_many :users
  delegate :username, :username=,:avatar, :avatar=, :email, :email=, :to => :user, allow_nil: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
