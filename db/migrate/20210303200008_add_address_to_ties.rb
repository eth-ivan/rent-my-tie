class AddAddressToTies < ActiveRecord::Migration[6.0]
  def change
    add_column :ties, :address, :string
  end
end
