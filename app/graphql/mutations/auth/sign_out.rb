module Mutations
  module Auth
    class SignOut < BaseMutation
      require 'json_web_token'

      description "Signs Out the user from the system"

      # Outputs
      field :success, Boolean, null: false

      def resolve
        authenticate_user
        session = nil
        session = Session.find_by(token: context[:decoded_token][:token]) if context[:decoded_token].present?
        session.deactivate! if session.present?
        {success: true}
      end
    end
  end
end