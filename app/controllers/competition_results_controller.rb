class CompetitionResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition_result, only: [ :show, :edit, :update, :destroy ]

  def index
    @competition_results = CompetitionResult.where(user_id: current_user.id).order(date: :DESC)
  end

  def new
    @competition_result = CompetitionResult.new
  end

  def create
    @competition_result = CompetitionResult.new(competition_result_params)

    if @competition_result.save
      redirect_to @competition_result
    else
      render new_competition_result_path
    end
  end

  def show
  end


  def update
    if @competition_result.update(competition_result_params)
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
      params.require(:competition_result).permit(:name, :venue, :date, :memo).merge(user_id: current_user.id)
    end
end
