class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :shipping_name
      t.string :billing_name
      t.string :index
      t.string :show
      t.string :new

      t.timestamps
    end
  end
end
