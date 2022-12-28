class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name, null: false, index: true
      t.string :phone, null: false
      t.string :email, null: true
      t.string :cost, null: true
      t.text :description, null: true
      t.string :status, default: 'active', null: false
      t.timestamps
    end
  end
end
