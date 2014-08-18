class StaticPagesController < ApplicationController
  layout 'front_page', only: :home
  def join
  end

  def home
    @events = Event.all.sample(5)
    @posts = Post.all.sample(4)
  end
end
