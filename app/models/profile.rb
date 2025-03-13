class Profile < ApplicationRecord
  belongs_to :user

  validates :goal, numericality: { greater_than_or_equal_to: 0 }
end
