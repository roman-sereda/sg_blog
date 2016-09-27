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

  def create
    @post=Post.create params.require(:post).permit(:title,:body)

    if @post.valid?
      @post.save
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to "/posts/new", :flash => { :error => "You entered wrong data" }
    end

  end
end
