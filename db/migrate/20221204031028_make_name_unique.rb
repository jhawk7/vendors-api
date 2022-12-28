class MakeNameUnique < ActiveRecord::Migration[7.0]
  def change
    change_column(:vendors, :name, :string, unique: true)
  end
end
