class CompetitionResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition_result, only: [ :show, :edit, :update, :destroy ]
  before_action :set_event_type, only: [ :new, :create, :show, :edit, :update ]

  def index
    @competition_results = CompetitionResult.includes(:sprints, :middle_and_longs, :jumpings, :throwings)
                                            .where(user_id: current_user.id)
                                            .order(date: :DESC)
  end

  def new
    @competition_result_form = CompetitionResultForm.new
  end

  def create
    @competition_result_form = CompetitionResultForm.new(competition_result_params)

    if @competition_result_form.save
      redirect_to competition_results_path, notice: "記録が登録されました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @competition_result_form = CompetitionResultForm.new(competition_result: @competition_result)
  end


  def update
    @competition_result_form = CompetitionResultForm.new(competition_result_params, competition_result: @competition_result)

    if @competition_result_form.update
      redirect_to @competition_result
    else
      render :edit
    end
  end

  def destroy
    @competition_result.destroy

    redirect_to competition_results_path, status: :see_other
  end

  private

    def set_competition_result
      @competition_result = current_user.competition_results.includes(
        :sprints, :middle_and_longs, { middle_and_longs: :lap_times }, :jumpings, :throwings)
        .find(params[:id])
    end

    def competition_result_params
      params.require(:competition_result_form).permit(
        :competition_result_id, :event_type, :name, :venue, :date, :memo,
        :sprint_detail, :sprint_record, :sprint_wind_speed,
        :middle_and_long_detail, :middle_and_long_record, :pacer,
        :jumping_detail, :jumping_record, :jumping_wind_speed, :jumping_approach_distance,
        :throwing_detail, :throwing_record, :throwing_approach_distance,
        :lap_time, :lap_distance
        ).merge(user_id: current_user.id)
    end

    def set_event_type
      @event_type = CompetitionResult.event_types.keys.map { |k| [ k, k ] }
    end
end
