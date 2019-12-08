module Types
  module Inputs
    class SignUpInputType < BaseInputObject
      # the name is usually inferred by class name but can be overwritten
      # graphql_name 'SignUpInputType'

      argument :email, String, required: true
      argument :username, String, required: true
      argument :password, String, required: true
    end
  end
end