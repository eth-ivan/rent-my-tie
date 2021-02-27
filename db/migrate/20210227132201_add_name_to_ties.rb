class AddNameToTies < ActiveRecord::Migration[6.0]
  def change
    add_column :ties, :name, :string
  end
end
