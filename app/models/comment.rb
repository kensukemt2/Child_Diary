class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :post, dependent: :destroy
end
