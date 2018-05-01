class BordComment < ApplicationRecord
  validates :comment, precence: true
  belongs_to :user
  belongs_to :trouble_bord
end
