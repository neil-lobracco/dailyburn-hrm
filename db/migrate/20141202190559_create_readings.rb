class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
        t.integer :session_id
        t.integer :bpm
        t.timestamp :start
        t.timestamp :end
        t.float :duration
    end
  end
end
