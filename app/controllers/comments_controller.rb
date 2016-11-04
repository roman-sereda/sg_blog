class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      @comment.user = current_user
    else
      flash.now[:danger] = "error"
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
