module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :status, Boolean, "True is published otherwise false", null: false
    field :posted_by, UserType, "Creator of the post", null: false, method: :user
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end