module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :name, String, "First name + Last name", null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :follower_count, Int, null: false
    field :followee_count, Int, null: false
    field :post_count, Int, null: false

    def name
      object.name
    end

    def follower_count
      object.followers.count
    end

    def followee_count
      object.followees.count
    end

    def post_count
      object.posts.where(status: true).count
    end

  end
end