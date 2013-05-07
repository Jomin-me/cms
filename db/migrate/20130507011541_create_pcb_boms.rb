class CreatePcbBoms < ActiveRecord::Migration
  def change
    create_table :pcb_boms do |t|
      t.string :name
      t.integer :comp_id
      t.text :mark
      t.integer :count
      t.text :info

      t.timestamps
    end
  end
end
