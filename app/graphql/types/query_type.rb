module Types
  class QueryType < Types::BaseObject
    field :me, resolver: Queries::Users::Me
    field :myPosts, resolver: Queries::Posts::MyPosts
    field :showPost, resolver: Queries::Posts::ShowPost
  end
end