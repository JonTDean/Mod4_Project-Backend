class AddPlayerIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :player_id, :integer
  end
end
