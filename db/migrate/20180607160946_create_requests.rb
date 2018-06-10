class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.text :schema
      t.string :trap_id
      t.timestamps
    end
    add_foreign_key :requests, :traps 
  end
end
