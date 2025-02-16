class CompetitionResult < ApplicationRecord
    belongs_to :user
    has_many :sprints, dependent: :destroy

    scope :with_sprint, -> { joins(:sprints).select("competition_results.*, sprints.record, sprints.wind_speed")}

    enum event_type: { no_event: 0, sprint: 1, middle_and_long: 2, jump: 3, throwing: 4, combined: 5 }
end
