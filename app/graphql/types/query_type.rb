module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, resolver: Queries::Resolvers::Users
    field :user, UserType, "Find a user by ID" do
      argument :id, ID
    end

    # ex.
    # query getUserById($id: ID!) {
    #   user(id: $id) {
    #     id
    #     name
    #   }
    # }
    #
    # QUERY VARIABLES
    # {
    #   "id": 1
    # }
    def user(id:)
      User.find(id)
    end
  end
end
