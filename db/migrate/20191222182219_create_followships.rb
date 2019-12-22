class CreateFollowships < ActiveRecord::Migration[6.0]
  def change
    create_table :followships do |t|
      t.bigint :follower_id
      t.bigint :followee_id
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :followships, :follower_id
    add_index :followships, :followee_id
    add_index :followships, :status
    add_index :followships, [:follower_id, :followee_id], unique: true
  end
end
