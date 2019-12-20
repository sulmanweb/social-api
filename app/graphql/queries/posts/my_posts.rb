module Queries
  module Posts
    class MyPosts < Queries::BaseQuery
      description "Shows the current_user's posts"

      # Outputs
      type [Types::PostType], null: false

      def resolve
        authenticate_user
        Post.where(user: context[:current_user])
      end
    end
  end
end