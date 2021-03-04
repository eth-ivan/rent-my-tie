class RemovePictureFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile_image
    remove_column :users, :picture
  end
end
