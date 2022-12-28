module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false, description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :update_vendor, VendorType, null: false, description: "Update vendor by name" do
      argument :vendor, Types::UpdateVendorInputType, required: true, description: "Vendor fields to be updated (name will not be changed)"
    end
    def update_vendor(args)
      Vendor.update_vendor(args[:vendor].to_h)
    end

    field :create_vendor, VendorType, null: false, description: "Create a vendor" do
      argument :vendor, Types::CreateVendorInputType, required: true, description: "Fields for creating a new vendor"
    end
    def create_vendor(args)
      Vendor.create_vendor(args[:vendor].to_h)
    end

    field :delete_vendor, VendorType, null: false, description: "Delete a vendor" do
      argument :name, String, required: true, description: "Name of vendor to be deleted"
    end
    def delete_vendor(args)
      Vendor.delete_vendor(name: args[:name])
    end 
  end
end
