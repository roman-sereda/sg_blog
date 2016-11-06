class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if !@comment.save
      flash.now[:danger] = "error"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
