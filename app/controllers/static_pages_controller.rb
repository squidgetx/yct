class StaticPagesController < ApplicationController
  def join
  end

  def home
    @events = Event.all.sample(3)
  end
end
