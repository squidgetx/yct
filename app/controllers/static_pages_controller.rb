class StaticPagesController < ApplicationController
  layout 'front_page', only: :home
  def join
  end

  def home
    @events = Event.all.sample(3)
  end
end
