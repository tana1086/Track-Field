class CompetitionResultForm
    include ActiveModel::Model

    attr_accessor :event_type, :name, :venue, :date, :memo, :record, :wind_speed, :approach, :lap_time, :pacer

    def initialize(attributes = nil, competition_result: CompetitionResult.new)
        @competition_result = competition_result
        attributes ||= default_attributes
        super(attributes)
    end

    def save
        competition_result = CompetitionResult.create(event_type: event_type, name: name, venue: venue, date: date, memo: memo)

        ActiveRecord::Base.transaction do
            case event_type
            when 'sprint'
                Sprint.create(competition_results_id: competition_result.id, record: record, wind_speed: wind_speed)
            # when 'middle_and_long'
            #     MiddleAndLong.create(competition_results_id: competition_result_id, record: record, lap_time: lap_time, pacer: pacer)
            # when 'jump'
            #     Jump.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, approach: approach)
            # when 'throwing'
            #     Throwing.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, approach: approach)
            # when 'combined'
            #     Combined.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, lap_time: lap_time, approach: approach)
            end
        end
    end

    private

    def default_attributes
        {
            event_type: @competition_result.event_type,
            name: @competition_result.name,
            venue: @competition_result.venue,
            date: @competition_result.date,
            memo: @competition_result.memo
        }
    end
end