class StaticPagesController < ApplicationController
  layout 'front_page', only: :home

  def donate
  end

  def settings
    authorize!
  end

  def home
    @events = Event.all.sample(5)
    @posts = Post.all.sample(4)
    @faqs = Faq.all
  end
end
