class ColumnPolicy < ApplicationPolicy
  class Scope < Scope
      def resolve
        #scope.all # If users can see all jobs
        scope.includes(:jobs).where(user: user) # If users can only see their jobs
        # scope.where("name LIKE 't%'") # If users can only see jobs starting with `t`
        # ...
      end
    end
end
