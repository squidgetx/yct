class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end
  def show

  end
  def edit
    @oldDesc = @post.text
    @oldName = @post.title
    @method = 'put'
    @path = post_path(@post)
    render "new"
  end
  def new
    @method = 'post'
    @path = posts_path
  end
  def create
    p = post_params
    p[:climber_id] = current_user
    @post = Post.create(post_params)
    redirect_to(@post)
  end
  def update
    Post.update(@post.id, post_params)
    redirect_to(@post)
  end
  def destroy
    @post.destroy
    redirect_to :action => 'index'
  end

  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.required(:post).permit(:title, :text)
  end

end
