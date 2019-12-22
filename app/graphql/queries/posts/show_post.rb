module Queries
  module Posts
    class ShowPost < Queries::BaseQuery
      description "Shows the post if user has access"

      # Inputs
      argument :id, ID, required: true

      # Outputs
      type Types::PostType, null: false

      def resolve(id:)
        authenticate_user
        set_post(id)
        authorize(context, @post)
        @post
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