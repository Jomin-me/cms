class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :name
      t.integer :element_id

      t.timestamps
    end
  end
end
