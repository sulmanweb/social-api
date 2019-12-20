module Types
  module Inputs
    class SignInInputType < BaseInputObject
      # the name is usually inferred by class name but can be overwritten
      # graphql_name 'SignUpInputType'

      argument :auth, String, required: true, description: "username or email allowed"
      argument :password, String, required: true
    end
  end
end