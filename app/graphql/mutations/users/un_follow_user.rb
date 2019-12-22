module Mutations
  module Users
    class UnFollowUser < BaseMutation
      require 'json_web_token'

      description "Makes user 1 unfollower of user 2"

      # Inputs
      argument :id, ID, required: true

      # Outputs
      field :success, Boolean, null: false

      def resolve(id:)
        authenticate_user
        user = User.find_by(id: id)
        raise GraphQL::ExecutionError.new(I18n.t('errors.not_found')) if user.nil?
        if context[:current_user].unfollow(user)
          {success: true}
        else
          raise GraphQL::ExecutionError.new(post.errors.full_messages.join(","))
        end
      end
    end
  end
end