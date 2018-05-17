class Circle < ApplicationRecord
  validates :circle_name, presence: true
  has_many :circle_members, dependent: :destroy
  has_many :user, through: :circle_members
  mount_uploader :circle_image, ImageUploader
end
