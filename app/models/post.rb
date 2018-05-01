class Post < ApplicationRecord
  validates :title, precence: true
  validates :content, precence: true
  belongs_to :user
  has_many :favorite_posts, dependent: :destroy
  has_many :follower, through: :favorite_posts, source: :user
  has_many :comment
  has_many :post_user, through: :comments, source: :user
end
