class CompetitionResultForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    # 共通
    attribute :competition_result
    attribute :event_type, :string
    attribute :name, :string
    attribute :venue, :string
    attribute :date, :date
    attribute :memo, :string
    attribute :user_id, :integer

    # 短距離
    attribute :sprint_record, :float
    attribute :sprint_wind_speed, :float

    # 中長距離
    attribute :middle_and_long_record, :float
    attribute :lap_time, :float
    attribute :pacer, :string

    # 跳躍
    attribute :jump_record, :float
    attribute :jump_wind_speed, :float
    attribute :jump_approach, :float

    # 投擲
    attribute :throwing_record, :float
    attribute :throwing_approach, :float

    # 混成


    def initialize(attributes = nil, competition_result: CompetitionResult.new)
        @competition_result = competition_result
        attributes ||= default_attributes
        super(attributes)
    end

    def save
        return unless valid?

        ActiveRecord::Base.transaction do
        @competition_result = CompetitionResult.create!(
            event_type: event_type,
            name: name,
            venue: venue,
            date: date,
            memo: memo,
            user_id: user_id
        )


            case event_type
            when 'sprint'
                @competition_result.sprints.build(
                    record: sprint_record,
                    wind_speed: sprint_wind_speed
                ).save!
            # when 'middle_and_long'
            #     MiddleAndLong.create(competition_results_id: competition_result_id, record: record, lap_time: lap_time, pacer: pacer)
            # when 'jump'
            #     Jump.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, approach: approach)
            # when 'throwing'
            #     Throwing.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, approach: approach)
            # when 'combined'
            #     Combined.create(competition_results_id: competition_result_id, record: record, wind_speed: wind_speed, lap_time: lap_time, approach: approach)
            end
        rescue => e
            return false
        end
    end

    private

    def default_attributes
        {
            event_type: @competition_result.event_type,
            name: @competition_result.name,
            venue: @competition_result.venue,
            date: @competition_result.date,
            memo: @competition_result.memo,
            user_id: @competition_result.user_id
        }
    end
end