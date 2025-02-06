class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_profile

  def after_sign_in_path_for(resource)
    if current_user.profile&.name.nil?
      new_profile_path
    else
      posts_path
    end
  end

  def set_profile
    @profile = current_user&.profile
  end
end
