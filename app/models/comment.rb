class Comment < ApplicationRecord
  validates :comment, precence: true
  belongs_to :user
  belongs_to :post
end
