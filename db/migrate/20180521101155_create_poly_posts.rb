class CreatePolyPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :poly_posts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.references :postable, polymorphic: true

      t.timestamps
    end
  end
end
