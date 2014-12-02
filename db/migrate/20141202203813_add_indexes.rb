class AddIndexes < ActiveRecord::Migration
  def up
    add_index :readings, :session_id
    add_index :sessions, :user_id
  end
  def down
      remove_index :readings, :column => :session_id
      remove_index :sessions, :column => :user_id
  end
end
