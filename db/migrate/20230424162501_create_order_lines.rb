class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines do |t|
      t.references :weapon, null: false, foreign_key: true
      t.integer :count
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
