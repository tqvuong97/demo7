class DropCommentHierarchies < ActiveRecord::Migration[5.2]
  def change
  	drop_table :comment_hierarchies
  end
end
