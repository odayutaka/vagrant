class AddUserIdToPostimage < ActiveRecord::Migration[5.2]
  def change
    add_column :postimages, :user_id, :integer
  end
end
