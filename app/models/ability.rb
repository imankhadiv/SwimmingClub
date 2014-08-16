class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      alias_action :create, :read, :update, :destroy, :to => :crud

      if user.role? 'administrator'
        can :manage, :all

      end

      if user.role? 'Swimmer'
        can [:read,:search,:edit,:update,:medical_conditions,:swimmer_times,:payment], Swimmer
        can [:read], Event
        can [:profile,:update,:destroy,:create], User
        can [:read], MedicalCondition
        can [:show], Payment

      end

      if user.role? 'Parent'
        can [:read,:search,:medical_conditions,:swimmer_times,:payment], Swimmer
        can [:read,:edit,:update,:destroy,:check_relation], Parent
        can [:read], SwimmerTime
        can [:read], Event
        can [:profile,:update], User
        can [:read], MedicalCondition
        can [:show], Payment


      end

      if user.role? 'Welfare Officer'
        can [:read,:search,:swimmer_times,:medical_conditions], Swimmer
        can [:read], Event
        can [:profile,:update], User

      end

      if user.role? 'Committee'
        can [:search,:swimmer_times,:medical_conditions], Swimmer
        can [:manage], Event
        can [:profile,:update], User
        can [:manage], Payment
      end

      if user.role? 'Coach'
        can [:search,:swimmer_times], Swimmer
        can [:read], Event
        can [:profile,:update], User

      end
      #
      # if user.role? :member
      #   can :read, [Show, ShowDate, ShowRole, Social]
      #   can :manage, [Foh, Board]
      #   can [:show, :update, :report], User, :id => user.id
      #   can [:attend, :read], [Training, Workshop]
      #   can [:show, :create], [RoleApplication]
      # end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
end