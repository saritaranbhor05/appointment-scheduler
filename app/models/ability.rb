class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new # guest user (not logged in)
    # Define common access ability here
    cannot :manage, Role

    # Every user can access/view his profile
    can [:show, :edit, :update], User do |u|
      u.id == @user.id
    end
    send(@user.role.name.delete(' ').underscore)
  end

  def owner
    can :manage, :all
  end

  def receptionist
    can :manage, Pet
    can :manage, Appointment
    can :read, User
  end

  def doctor
    can :read, User
    can [:new, :create, :read], Pet
    can :manage, Appointment
  end

  def customer
    can :read, Pet
    cannot [:new, :create, :edit, :update], Appointment
    can :read, Appointment
  end
end
