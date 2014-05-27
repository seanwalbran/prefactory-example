class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :initiator_id
      t.integer :acceptor_id

      t.timestamps
    end
  end
end
