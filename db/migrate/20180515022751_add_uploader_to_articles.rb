class AddUploaderToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :uploader, :string
  end
end
