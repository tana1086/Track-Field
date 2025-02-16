class CompetitionResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition_result, only: [ :show, :edit, :update, :destroy ]
  before_action :set_event_type, only: [ :new, :create ]

  def index
    @competition_results = CompetitionResult.with_sprint.where(user_id: current_user.id).order(date: :DESC)
  end

  def new
    @competition_result_form = CompetitionResultForm.new
  end

  def create
    @competition_result_form = CompetitionResultForm.new(competition_result_params)

    if @competition_result_form.save
      redirect_to competition_results_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @competition_result_form = CompetitionResultFrom.new(competition_result: @competition_result)
  end


  def update
    if CompetitionResultForm.new(competition_result: @competition_result)
      redirect_to @competition_result
    else
      render edit_competition_result_path(@competition_result)
    end
  end

  def destroy
    @competition_result.destroy

    redirect_to competition_results_path, status: :see_other
  end

  private

    def set_competition_result
      @competition_result = CompetitionResult.find(params[:id])
    end

    def competition_result_params
      params.require(:competition_result_form).permit(:competition_result_id, :name, :venue, :date, :memo, :event_type, :record, :wind_speed, :lap_time, :approach, :pacer).merge(user_id: current_user.id)
    end

    def set_event_type
      @event_type = CompetitionResult.event_types.keys.map { |k| [k, k] }
    end
end
