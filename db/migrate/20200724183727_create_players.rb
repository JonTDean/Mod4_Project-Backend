class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :user_id
      t.integer :hp
      t.integer :mp
      t.integer :phys
      t.integer :mag
      t.integer :def
      t.integer :res
      t.integer :luck

      t.timestamps
    end
  end
end
