class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  # Setup accessible (or protected) attributes for your model

  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  validates :username, presence: true, uniqueness: true
  has_many :messages

  attr_accessor :login

  validates :username,
  :presence => true,
  :uniqueness => {
  :case_sensitive => false
  } # etc.

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  elsif conditions.has_key?(:username) || conditions.has_key?(:email)
    where(conditions.to_hash).first
  end

end
end
