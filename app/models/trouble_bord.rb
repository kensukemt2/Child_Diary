class TroubleBord < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  has_many :bord_comments, dependent: :destroy
  belongs_to :user
end
