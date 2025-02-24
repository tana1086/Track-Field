class Sprint < ApplicationRecord
    belongs_to :competition_result

    validates :sprint_detail, presence: true
    validates :record,     presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :wind_speed, presence: true

    enum sprint_detail: { m_100: 1, m_200: 2, m_400: 3, m_100H: 4, m_110H: 5, m_400H: 6 }
end
