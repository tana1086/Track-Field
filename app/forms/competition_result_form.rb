class CompetitionResultForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    # 共通
    attribute :event_type, :string
    attribute :name, :string
    attribute :venue, :string
    attribute :date, :date
    attribute :memo, :string
    attribute :user_id, :integer

    # 短距離
    attribute :sprint_detail, :string
    attribute :sprint_record, :float
    attribute :sprint_wind_speed, :float

    # 中長距離
    attribute :middle_and_long_detail, :string
    attribute :middle_and_long_record, :float
    attribute :pacer, :string

    # 跳躍
    attribute :jumping_detail, :string
    attribute :jumping_record, :float
    attribute :jumping_wind_speed, :float
    attribute :jumping_approach_distance, :float

    # 投擲
    attribute :throwing_detail, :string
    attribute :throwing_record, :float
    attribute :throwing_approach_distance, :float

    # 混成

    #ラップタイム
    attribute :lap_time, :float
    attribute :lap_distance, :integer

    validates :event_type, presence: true

    with_options if: -> { event_type == "sprint" } do
        validates :sprint_detail, presence: true
        validates :sprint_record, presence: true
        validates :sprint_wind_speed, presence: true
    end

    with_options if: -> { event_type == "middle_an d_long"} do
        validates :middle_and_long_detail, presence: true
        validates :middle_and_long_record, presence: true
    end

    with_options if: -> { event_type == "jumping"}  do
        validates :jumping_detail, presence: true
        validates :jumping_record, presence: true
        validates :jumping_wind_speed, presence: true
    end

    with_options if: -> { event_type == "throwing" } do
        validates :throwing_detail, presence: true
        validates :throwing_record, presence: true
    end


    def initialize(attributes = nil, competition_result: CompetitionResult.new)
        @competition_result = competition_result
        attributes ||= default_attributes
        super(attributes)
    end

    # competition_resultが保存されているかを判断(アクションをPOSTとPATCHを切り替える)
    delegate :persisted?, to: :competition_result

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
            when "sprint"
                @competition_result.sprints.build(
                    sprint_detail: sprint_detail,
                    record: sprint_record,
                    wind_speed: sprint_wind_speed
                ).save!
            when "middle_and_long"
                @middle_and_long =  @competition_result.middle_and_longs.build(
                    middle_and_long_detail: middle_and_long_detail,
                    record: middle_and_long_record,
                    pacer: pacer
                    )
                @middle_and_long.lap_times.build(
                    time: lap_time,
                    distance: lap_distance
                )
                @middle_and_long.save!
            when "jumping"
                @competition_result.jumpings.build(
                    jumping_detail: jumping_detail,
                    record: jumping_record,
                    wind_speed: jumping_wind_speed,
                    approach_distance: jumping_approach_distance
                    ).save!
            when "throwing"
                @competition_result.throwings.build(
                    throwing_detail: throwing_detail,
                    record: throwing_record,
                    approach_distance: throwing_approach_distance
                    ).save!
            end
        rescue => e
            false
        end
    end

    def update
        return unless valid?

        ActiveRecord::Base.transaction do
            @competition_result.update!(
                name: name,
                venue: venue,
                date: date,
                memo: memo,
            )

            case @competition_result.event_type
            when "sprint"
                @competition_result.sprints.update!(
                    sprint_detail: sprint_detail,
                    record: sprint_record,
                    wind_speed: sprint_wind_speed
                )
            when "middle_and_long"
                @middle_and_long =  @competition_result.middle_and_longs.update!(
                    middle_and_long_detail: middle_and_long_detail,
                    record: middle_and_long_record,
                    pacer: pacer
                    ).save!
                @middle_and_long.lap_times.update!(
                    time: lap_time,
                    distance: lap_distance
                )
            when "jumping"
                @competition_result.jumpings.update!(
                    jumping_detail: jumping_detail,
                    record: jumping_record,
                    wind_speed: jumping_wind_speed,
                    approach_distance: jumping_approach_distance
                    )
            when "throwing"
                @competition_result.throwings.update!(
                    throwing_detail: throwing_detail,
                    record: throwing_record,
                    approach_distance: throwing_approach_distance
                    )
            end
        rescue => e
            false
        end
    end

    private

    attr_reader :competition_result

    def default_attributes
        attributes = { 
          event_type: c ompetition_result.event_type,
          name: competition_result.name,
          venue: competition_result.venue,
          date: competition_result.date,
          memo: competition_result.memo
        }

        if competition_result.event_type == "sprint"
          sprint = competition_result.sprints.first
          attributes.merge!(
            sprint_detail: sprint&.sprint_detail,
            sprint_record: sprint&.record,
            sprint_wind_speed: sprint&.wind_speed
            )
        elsif competition_result.event_type == "middle_and_long"
            middle_and_long = competition_result.middle_and_longs.first
            attributes.merge!(
            middle_and_long_detail: middle_and_long&.middle_and_long_detail,
            middle_and_long_record: middle_and_long&.record,
            pacer: middle_and_long&.pacer,
            lap_time: middle_and_long&.lap_times.first&.time,
            lap_distance: middle_and_long&.lap_times.first&.distance
            )
        elsif competition_result.event_type == "jumping"
            jumping = competition_result.jumpings.first
            attributes.merge!(
            jumping_detail: jumping&.jumping_detail,
            jumping_record: jumping&.record,
            jumping_wind_speed: jumping&.wind_speed,
            jumping_approach_distance: competition_result.jumpings.first&.approach_distance
            )
        elsif competition_result.event_type == "throwing"
            throwing = competition_result.throwings.first
            attributes.merge!(
            throwing_detail: throwing&.throwing_detail,
            throwing_record: throwing&.record,
            throwing_approach_distance: throwing&.approach_distance
            )
        end
    end
end
