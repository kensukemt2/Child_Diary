class Circle < ApplicationRecord
  has_many :circle_members, dependent: :destroy
  has_many :user, through: :circle_members
end
