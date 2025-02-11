class CompetitionResult < ApplicationRecord
    belongs_to :user
    belongs_to :sprint

    enum event_type: { no_event: 0, sprint: 1, middle_and_long: 2, jump: 3, throwing: 4, combined: 5 }
end
