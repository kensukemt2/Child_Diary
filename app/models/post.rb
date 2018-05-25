class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :favorite_posts, dependent: :destroy
  has_many :followers, through: :favorite_posts, source: :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  mount_uploader :image, ImageUploader
end
