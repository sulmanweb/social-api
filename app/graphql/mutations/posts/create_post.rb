module Mutations
  module Posts
    class CreatePost < BaseMutation
      require 'json_web_token'

      description "Creates a new post for the user"

      # Inputs
      argument :input, Types::Inputs::PostInputType, required: true

      # Outputs
      field :post, Types::PostType, null: false

      def resolve(input: nil)
        authenticate_user
        post = context[:current_user].posts.build(input.to_h)
        if post.save
          {post: post}
        else
          raise GraphQL::ExecutionError.new(post.errors.full_messages.join(","))
        end
      end
    end
  end
end