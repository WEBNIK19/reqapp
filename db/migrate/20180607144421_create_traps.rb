class CreateTraps < ActiveRecord::Migration[5.1]
  def change
    create_table :traps, id: :string do |t|
      t.timestamps
    end
  end
end
