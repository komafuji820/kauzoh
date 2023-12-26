class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string      :memo
      t.references  :group, null: false, foreign_key: true
      t.integer     :category_id, null: false
      t.integer     :priority_id, null: false

      t.timestamps
    end
  end
end