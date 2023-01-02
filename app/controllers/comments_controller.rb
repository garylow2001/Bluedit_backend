class CommentsController < ApplicationController
  before_action :get_post
  before_action :set_comment, only: %i[ show update destroy ]
  before_action :authorized

  # GET /comments
  def index
    @comments = @post.comments.joins(:user).select("comments.* , users.username").where("comments.user_id = users.id")

    render json: @comments
  end

  # GET /comments/1 #### currently : /posts/post_id/comments/comment_id where comment_id is unique eg p/2/c/3 exists but p/2/c/1 doesn't
  def show
    @comment = @post.comments.joins(:user).select("comments.* , users.username").where("comments.user_id = users.id").find(params[:id])
    render json: @comment
  end

  # POST /comments
  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      render json: @comment #, status: :created, location: @post.comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end

    def get_post
      @post = Post.find(params[:post_id])
    end
end
