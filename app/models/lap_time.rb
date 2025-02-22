class LapTime < ApplicationRecord
    belongs_to :middle_and_long

    validates :time,     numericality: { greater_than_or_equal_to: 0}
    validates :distance, numericality: { greater_than_or_equal_to: 0}
end
