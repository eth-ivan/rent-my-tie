class AddCoordinatesToTies < ActiveRecord::Migration[6.0]
  def change
    add_column :ties, :latitude, :float
    add_column :ties, :longitude, :float
  end
end
