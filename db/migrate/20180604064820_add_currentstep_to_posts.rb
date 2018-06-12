class AddCurrentstepToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :current_step, :string
  end
end
