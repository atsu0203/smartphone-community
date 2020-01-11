class Post < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  # belongs_to :category
  has_many :comments 
  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end

