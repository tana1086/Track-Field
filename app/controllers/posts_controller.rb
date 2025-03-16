class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show destroy ]
  before_action :correct_post, only: %i[ edit update ]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(user: :profile).order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: "新しい投稿が作成されました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "投稿が更新されました！" }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "投稿が削除されました！" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :image)
    end

    def correct_post
      @post = Post.find(params[:id])
      @user = @post.user
      redirect_to(posts_path) unless @user == current_user
    end
end
