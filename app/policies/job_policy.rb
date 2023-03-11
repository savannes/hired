class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      #scope.all # If users can see all jobs
      scope.where(user: user) # If users can only see their jobs
      # scope.where("name LIKE 't%'") # If users can only see jobs starting with `t`
      # ...
    end
  end

  def show?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def new?
    user
  end

  def create?
    user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def move?
    record.user == user
  end
end
