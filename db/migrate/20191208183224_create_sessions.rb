class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :sessions, :token, unique: true
    add_index :sessions, :status
  end
end
