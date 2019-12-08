module Mutations
  module Auth
    class SignUp < BaseMutation
      require 'json_web_token'

      description "Signs Up the user into the system"

      # Inputs
      argument :input, Types::Inputs::SignUpInputType, required: true

      # Outputs
      field :token, String, null: false
      field :user, Types::UserType, null: false

      def resolve(input: nil)
        user = User.new(username: input.username, email: input.email, password: input.password)

        if user.save
          session = Session.create!(user: user)
          token = nil
          token = JsonWebToken.encode({user_id: user.id, token: session}) if session.present?
          if token
            return {user: user, token: token}
          else
            GraphQL::ExecutionError.new(I18n.t('errors.auth.token_not_created'))
          end
        else
          GraphQL::ExecutionError.new(user.errors.full_messages.join(', '))
        end
      end
    end
  end
end