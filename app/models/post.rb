class Post < ActiveRecord::Base
  belongs_to :climber

  def self.view user
    if user.nil? || user.id.nil?
      Post.where('private = false')
    else
      Post.all
    end
  end



end
