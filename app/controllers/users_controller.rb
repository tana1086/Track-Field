class UsersController < ApplicationController
  before_action :set_user, only: [ :liked_posts ]

  def liked_posts
    @like_posts = current_user.likes.includes(:post).map(&:post)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
