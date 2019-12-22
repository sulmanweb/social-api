module Types
  module Inputs
    class PostInputType < BaseInputObject
      # the name is usually inferred by class name but can be overwritten
      # graphql_name 'SignUpInputType'

      argument :content, String, required: true
      argument :status, Boolean, required: true
    end
  end
end