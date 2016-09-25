class Wall < ApplicationRecord
  has_many :post
  has_many :users
  has_many :comments
  has_many :messages, dependent: :destroy

  delegate :username, :username=,:avatar, :avatar=, :email, :email=, :to => :user, allow_nil: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
