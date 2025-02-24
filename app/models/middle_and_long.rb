class MiddleAndLong < ApplicationRecord
    belongs_to :competition_result
    has_many :lap_times, dependent: :destroy

    validates :middle_and_long_detail, presence: true
    validates :record, presence: true, numericality: { greater_than_or_equal_to: 0 }

    enum middle_and_long_detail: { m_800: 1, m_1500: 2, m_3000: 3,  m_5000: 4, m_10000: 5, m_3000sc: 6 }
end
