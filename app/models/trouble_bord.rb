class TroubleBord < ApplicationRecord
  validates :title, precence: true
  validates :content, precence: true
  validates :user_id, precence: true
  has_many :bord_comments, dependent: :destroy
end
