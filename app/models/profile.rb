class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :goal, numericality: { greater_than_or_equal_to: 0 }
end
