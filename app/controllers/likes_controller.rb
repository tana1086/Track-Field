class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [ :create, :destroy ]

  def create
      @post_like = Like.find_or_create_by(user_id: current_user.id, post_id: @post.id)

    if @post_like
      @post_like.save!
      render turbo_stream: turbo_stream.replace(
        "like_button_#{@post.id}",
        partial: "likes/like_button",
        locals: { post: @post, like: true },
      )
    else
      redirect_to @post
    end
  end

  def destroy
    @post_like = Like.find_by(user_id: current_user.id, post_id: @post.id)

    if @post_like
      @post_like.destroy!

      render turbo_stream: turbo_stream.replace(
          "like_button_#{@post.id}",
          partial: "likes/like_button",
          locals: { post: @post, like: false },
        )
    else
        redirect_to @post
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
