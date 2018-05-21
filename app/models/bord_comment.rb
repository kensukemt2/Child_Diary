class BordComment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :trouble_bord
end
