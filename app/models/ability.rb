class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
      when 'member'
    end
  end
end
