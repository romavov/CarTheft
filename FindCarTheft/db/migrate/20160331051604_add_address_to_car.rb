class AddAddressToCar < ActiveRecord::Migration
  def change
    add_column :cars, :address, :string
  end
end
