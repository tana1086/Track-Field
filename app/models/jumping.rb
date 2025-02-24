class Jumping < ApplicationRecord
    belongs_to :competition_result

    validates :jumping_detail, presence: true
    validates :record,     presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :wind_speed, presence: true

    enum jumping_detail: { long_jump: 1, triple_jump: 2, high_jump: 3,  pole_vault: 4 }
end
