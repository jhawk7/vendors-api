# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Vendor.create!([
    {
        id: 1,
        name: "vendor_A", 
        phone: "111-111-1111", 
        email: "vendorA@someurl.com", 
        description: "this is a random vendor", 
        cost: "1.00", 
        status: "active"
    },
    {
        id: 2,
        name: "vendor_B", 
        phone: "112-111-1111", 
        email: "vendorB@someurl.com", 
        description: "this is a random vendor", 
        cost: "1.00", 
        status: "active"
    }
]) unless Vendor.find_by(id: 1)