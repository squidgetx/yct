class StaticPagesController < ApplicationController
  layout 'front_page', only: :home

  def donate
  end

  def settings
    authorize! :manage, :settings
  end

  def home
    @events = Event.all.sample(5)
    @posts = Post.order('created_at DESC').limit(4)
    @faqs = Faq.all
  end
end
