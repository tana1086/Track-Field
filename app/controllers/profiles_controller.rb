class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :edit, :update, :show ]

  def show
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

  private

  def set_profile
      @profile = current_user.profile
  end

  def  profile_params
    params.require(:profile).permit(:name, :icon, :areas, :event, :goal, :self_introduction).merge(user_id: current_user.id)
  end
end
