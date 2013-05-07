class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :element_id
      t.integer :specification_id
      t.integer :package_id
      t.string :supplier
      t.integer :stock
      t.decimal :price
      t.text :info

      t.timestamps
    end
  end
end
