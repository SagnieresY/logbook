class FlightPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_check  # Anyone can view a flight
  end

   def create?
    true  # Anyone can create a flight
  end

  def update?
    user_check  # Only flight creator can update it
  end

   def destroy?
    user_check  # Only flight creator can update it
  end

  def edit?
    user_check
  end

  def import?
    true
  end

  def user_check
    record.user == user
  end
end
