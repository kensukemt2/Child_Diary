class BordComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :trouble_bord
end
