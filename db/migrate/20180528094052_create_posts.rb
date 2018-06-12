class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :body
      t.string :conclusion
      t.string :aboutauthor

      t.timestamps
    end
  end
end
