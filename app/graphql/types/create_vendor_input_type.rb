# frozen_string_literal: true

module Types
  class CreateVendorInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :phone, String, required: true
    argument :email, String, required: true
    argument :cost, String, required: false
    argument :description, String, required: false
  end
end
