class VendorsController < ApplicationController
    before_action only: [:show, :destroy, :update] do
        validate_params(%w[name])
    end

    before_action only: [:create] do
        validate_params(%w[name phone])
    end

    def create
        vendor = Vendor.create_vendor(accepted_params)
        render json: {:data => vendor}, status: 201
    end

    def show
        vendor = Vendor.get_vendor_by_name(name: accepted_params[:name])
        render json: {:data => vendor}, status: 200
    end

    def index
        vendors = Vendor.get_active_vendors
        render json: {:data => vendors}, status: 200
    end

    def update
        vendor = Vendor.update_vendor(accepted_params)
        render json: {:data => vendor}, status: 200
    end

    def destroy
        Vendor.delete_vendor(name: accepted_params[:name])
        render status: 204
    end

    private

    def accepted_params
        params[:name] = params[:name].downcase.tr(' ', '_')
        params.permit(:name, :phone, :email, :description, :cost)
    end

    def validate_params(expected_params)
        expected_params.each do |expected_param|
            raise Error::ArgumentError, "missing #{expected_param} in request" unless params.include?(expected_param)
        end
    end
end
