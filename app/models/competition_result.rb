class CompetitionResult < ApplicationRecord
    belongs_to :user
    has_many :sprints, dependent: :destroy
    has_many :middle_and_longs, dependent: :destroy
    has_many :jumpings, dependent: :destroy
    has_many :throwings, dependent: :destroy


    validates :event_type, presence: true

    enum event_type: { sprint: 1, middle_and_long: 2, jumping: 3, throwing: 4}
end
