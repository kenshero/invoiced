class ChangeProfileImageToProfileImageId < ActiveRecord::Migration
  def change
  	rename_column :users, :profile_image, :profile_image_id
  end
end
