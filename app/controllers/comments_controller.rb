class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:body, :post_id))
    redirect_to post_path(@post)
  end

  def comment_params

  end
end
