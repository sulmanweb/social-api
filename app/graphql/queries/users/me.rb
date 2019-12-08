module Queries
  module Users
    class Me < Queries::BaseQuery
      description "Shows the current_user"

      # Outputs
      type Types::UserType, null: false

      def resolve
        authenticate_user
        context[:current_user]
      end
    end
  end
end