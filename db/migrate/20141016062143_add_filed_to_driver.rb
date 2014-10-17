class AddFiledToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :first_name, :string
    add_column :drivers, :last_name, :string
    add_column :drivers, :mobile_number, :integer,limit: 8, null: false, default: ""
    add_column :drivers, :device_id, :string
    add_column :drivers, :device_type, :string
  end
end
