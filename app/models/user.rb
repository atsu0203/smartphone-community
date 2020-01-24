class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
#  has_many :liked_posts, through: :likes, source: :post
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 8 }

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

end
