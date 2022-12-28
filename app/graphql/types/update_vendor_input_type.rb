# frozen_string_literal: true

module Types
  class UpdateVendorInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :phone, String, required: false
    argument :email, String, required: false
    argument :cost, String, required: false
    argument :description, String, required: false
  end
end
