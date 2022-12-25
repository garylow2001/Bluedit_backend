class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :authorized

  # GET /posts
  def index
    @posts = Post.joins(:user).select("posts.* , users.username").where("posts.user_id = users.id")
    #if want only posts from user: Post.where user: @user.id
    render json: @posts
  end

  # GET /posts/1
  def show
    # used to be @post
    @post = Post.joins(:user).select("posts.* , users.username").where("posts.user_id = users.id").find(params[:id])
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = @user

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :category, :user_id)
    end
end
