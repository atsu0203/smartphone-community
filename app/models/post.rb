class Post < ApplicationRecord
  validates :name,length:{ maximum: 16 }, presence: true
  validates :text, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :category
  has_many :comments 
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  mount_uploader :image, ImageUploader

  after_create do
    post = Post.find_by(id: self.id)
    tags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      post.tags << tag
    end
  end

  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?) OR text LIKE(?)', "%#{search}%","%#{search}%")
  end
end
