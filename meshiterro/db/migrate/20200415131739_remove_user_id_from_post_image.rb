class RemoveUserIdFromPostImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :User_id, :interger
  end
end
