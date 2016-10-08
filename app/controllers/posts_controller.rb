class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post=Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/"
  end

  def update
    @post = Post.update(params[:id], post_params)
    check_text_validation
  end

  def create
    @post=Post.create params.require(:post).permit(:title, :body, :image)
    check_text_validation
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def check_text_validation
    if @post.valid?
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path, :flash => { :error => "You entered wrong data" }
    end
  end

end
