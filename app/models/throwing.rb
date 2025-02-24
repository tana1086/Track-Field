class Throwing < ApplicationRecord
    belongs_to :competition_result

    validates :throwing_detail, presence: true
    validates :record, presence: true, numericality: { greater_than_or_equal_to: 0 }

    enum throwing_detail: { shot_put: 1, discus_throw: 2, hammer_throw: 3, javelin_throw: 4 }
end
