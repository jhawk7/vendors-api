class Vendor < ApplicationRecord
    validates :name, :phone, presence: true

    def self.create_vendor(params)
        vendor = Vendor.create!(
            name: params[:name], phone: params[:phone], email: params[:email], 
            description: params[:description], cost: params[:cost], status: 'active'
        )
    end

    def self.get_vendor_by_name(name:)
        #find_by will return null instead of raising RecordNotFound
        vendor = Vendor.find_by(name: name)
        raise ActiveRecord::RecordNotFound if vendor.nil?
    end

    def self.get_active_vendors
        active_vendors = Vendor.where(status: 'active')
    end

    def self.get_all_vendors
        all_vendors = Vendor.all.to_a
    end

    def self.update_vendor(params)
        vendor = Vendor.find_by(name: params[:name], status: 'active')
        raise ActiveRecord::RecordNotFound if vendor.nil?

        vendor.phone = params[:phone] unless params[:phone].nil?
        vendor.email = params[:email] unless params[:email].nil?
        vendor.cost = params[:cost] unless params[:cost].nil?
        vendor.save!
        vendor
    end

    def self.delete_vendor(name:)
        vendor = Vendor.find_by(name: name, status: 'active')
        raise ActiveRecord::RecordNotFound if vendor.nil?
        
        vendor.status = 'inactive'
        vendor.save!
        vendor
    end
end

