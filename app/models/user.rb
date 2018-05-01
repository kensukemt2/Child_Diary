class User < ApplicationRecord
  validates :name, precence: true, length: { maximum: 30 }
  validates :email, precence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, precence: true, length: { minimum: 6 }
  before_save { email.downcase! }

  has_many :posts, dependent: :destroy
  has_many :trouble_bords
  has_many :bord_comments
  has_many :comments

  has_many :favorite_posts, dependent: :destroy
  has_many :favorite_user_posts, through: :favorite_posts, source: :post

  has_many :circle_members, dependent: :destroy
  has_many :favorite_circles, through: :circle_members, source: :circle

  has_many :active_favorite_users, foreign_key: 'follower_id',
            class_name: 'favorite_user', dependent: :destroy
  has_many :passive_favorite_users, foreign_key: 'followed_id',
            class_name: 'favorite_user', dependent: :destroy
  has_many :following, through: :active_favorite_users, source: :followed_id
  has_many :followers, through: :passive_favorite_users, source: :follower_id
end
