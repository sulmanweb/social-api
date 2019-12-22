module Mutations
  module Posts
    class UpdatePost < BaseMutation
      require 'json_web_token'

      description "Updates the post only creator can perform this."

      # Inputs
      argument :id, ID, required: true
      argument :input, Types::Inputs::PostInputType, required: true

      # Outputs
      field :post, Types::PostType, null: false

      def resolve(id:, input: nil)
        authenticate_user
        set_post(id)
        authorize(context, @post)
        if @post.update(input.to_h)
          {post: @post}
        else
          raise GraphQL::ExecutionError.new(post.errors.full_messages.join(","))
        end
      end

      def set_post(id)
        @post = Post.find_by(id: id)
        raise GraphQL::ExecutionError.new(I18n.t('errors.not_found')) if @post.nil?
      end

      def authorize(context, post)
        if post.user != context[:current_user]
          raise GraphQL::ExecutionError.new(I18n.t('errors.unauthorized'))
        end
      end
    end
  end
end