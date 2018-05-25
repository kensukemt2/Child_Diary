class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } , on: :create
  before_save { email.downcase! }

  has_many :posts, dependent: :destroy
  has_many :trouble_bords
  has_many :bord_comments
  has_many :comments
  has_many :circles

  has_many :favorite_posts, dependent: :destroy
  has_many :favorite_another_posts, through: :favorite_posts, source: :post

  has_many :circle_members, dependent: :destroy
  has_many :favorite_circles, through: :circle_members, source: :circle

  has_many :active_favorite_users, foreign_key: 'follower_id',
            class_name: 'FavoriteUser', dependent: :destroy
  has_many :passive_favorite_users, foreign_key: 'followed_id',
            class_name: 'FavoriteUser', dependent: :destroy
  has_many :following, through: :active_favorite_users, source: :followed
  has_many :followers, through: :passive_favorite_users, source: :follower
  mount_uploader :image, ImageUploader

  def follow!(other_user)
    active_favorite_users.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_favorite_users.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_favorite_users.find_by(followed_id: other_user.id).destroy
  end
end
