class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil? || user.id.nil?
      # guest user

      can :read, Post
      return
    end
    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
        can [:edit, :create], Post
      when 'member' || 'moderator'
        can [:read], Post
    end
  end
end
