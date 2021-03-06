class AddFiledToCars < ActiveRecord::Migration
  def change
    add_column :cars, :name, :string
    add_column :cars, :total_passenger, :integer, limit: 8, null: false, default: ""
    add_column :cars, :total_luggage, :string
  end
end
