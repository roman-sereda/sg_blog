class PostsController < ApplicationController
   before_filter :find_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def destroy
    @post.remove_image!
    @post.destroy
    redirect_to "/"
  end

  def update
    @post.remove_image! if params[:remove_image]==1

    @post = Post.update(params[:id], post_params)
    check_text_validation
  end

  def create
    @post=Post.create params.require(:post).permit(:title, :body, :image)
    check_text_validation
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_image)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def check_text_validation
    if @post.valid?
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path, :flash => { :error => "You entered wrong data" }
    end
  end

end
