module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    #specifiying query name, graphql return type, nullable option, desc
    field :active_vendors, [Types::VendorType], null: false, description: "View active vendors"
    #defining query method
    def active_vendors
      Vendor.get_active_vendors
    end

    field :all_vendors, [Types::VendorType], null: false, description: "View all vendors (active/inactive)"
    def all_vendors
      Vendor.get_all_vendors
    end
  end
end
