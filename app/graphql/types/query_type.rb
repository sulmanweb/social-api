module Types
  class QueryType < Types::BaseObject
    field :me, resolver: Queries::Users::Me
  end
end