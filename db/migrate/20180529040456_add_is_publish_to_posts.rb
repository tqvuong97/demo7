class AddIsPublishToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ispublish, :integer
  end
end
