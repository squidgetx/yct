class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post, only: [:show, :edit, :destroy, :update]
  respond_to :html, :json

  def index
    @posts = Post.all
  end
  def show

  end
  def edit
  end
  def new
  end
  def create
    p = post_params
    p[:climber_id] = current_user.id
    @post = Post.create(p)
    redirect_to(@post)
  end
  def update
    Post.update(@post.id, post_params)
    respond_to do |format|
      format.html { redirect_to (@post) }
      format.json { respond_with_bip(@post) }
    end
  end
  def destroy
    @post.destroy
    redirect_to :action => 'index'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.required(:post).permit(:title, :text)
  end

end
