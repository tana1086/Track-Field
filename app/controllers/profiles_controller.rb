class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :edit, :update, :show ]

  def show
    @user = User.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: "プロフィールが作成されました！"
    else
      render new_profile_path, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "プロフィールが更新されました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def fetch_data
    event_category = params[:eventCategory]
    event_category_detail = params[:eventCategoryDetail]

    # @data = [["hoge", 50], ["fuga", 30]]

    if event_category == "短距離"
      results = current_user.competition_results.joins(:sprints)
                                                .where(sprints: { sprint_detail: event_category_detail })
                                                .pluck("competition_results.date", "sprints.record")
    elsif event_category == "中長距離"
      results = current_user.competition_results.joins(:middle_and_longs)
                                                .where(middle_and_longs: { middle_and_long_detail: event_category_detail })
                                                .pluck("competition_results.date", "middle_and_longs.record")
    elsif event_category == "跳躍"
      results = current_user.competition_results.joins(:jumpings)
                                                .where(jumpings: { jumping_detail: event_category_detail })
                                                .pluck("competition_results.date", "jumpings.record")
    elsif event_category == "投てき"
      results = current_user.competition_results.joins(:throwings)
                                                .where(throwings: { throwing_detail: event_category_detail })
                                                .pluck("competition_results.date", "throwings.record")
    end

    render json: { results: results }
  end

  private

  def set_profile
      @profile = current_user&.profile
  end

  def  profile_params
    params.require(:profile).permit(:name, :icon, :areas, :event, :goal, :self_introduction).merge(user_id: current_user.id)
  end
end
