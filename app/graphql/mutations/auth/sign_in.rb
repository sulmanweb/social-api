module Mutations
  module Auth
    class SignIn < BaseMutation
      require 'json_web_token'

      description "Signs In the user into the system"

      # Inputs
      argument :input, Types::Inputs::SignInInputType, required: true

      # Outputs
      field :token, String, null: false
      field :user, Types::UserType, null: false

      def resolve(input: nil)
        user = User.find_by(username: input.auth)
        if user.nil?
          user = User.find_by(email: input.auth)
        end

        if user && user.authenticate(input.password)
          session = Session.create!(user: user)
          token = nil
          token = JsonWebToken.encode({user_id: user.id, token: session.token}) if session.present?
          if token
            return {user: user, token: token}
          else
            raise GraphQL::ExecutionError.new(I18n.t('errors.auth.invalid_credentials'))
          end
        else
          raise GraphQL::ExecutionError.new(user.errors.full_messages.join(', '))
        end
      end
    end
  end
end