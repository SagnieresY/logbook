class FlightPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user  # Anyone can view a flight
  end

   def create?
    true  # Anyone can create a flight
  end

   def update?
    record.user == user  # Only flight creator can update it
  end

   def destroy?
    record.user == user  # Only flight creator can update it
  end

  def import?
    true
  end
end
