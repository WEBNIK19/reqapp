class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :scheme
      t.string :method
      t.string :remote_ip
      t.string :params
      t.string :trap_id
      t.text :headers
      t.text :query_string
      t.text :cookies
      t.text :request_env
      t.timestamps
    end
    add_foreign_key :requests, :traps 
  end
end
