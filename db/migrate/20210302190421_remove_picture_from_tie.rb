class RemovePictureFromTie < ActiveRecord::Migration[6.0]
  def change
    remove_column :ties, :picture
  end
end
