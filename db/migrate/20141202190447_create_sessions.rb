class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
        t.integer :user_id
        t.timestamp :created_at
        t.float :duration
        t.float :bpm_mean
        t.float :bpm_min
        t.float :bpm_max
        t.float :zone1_time
        t.float :zone2_time
        t.float :zone3_time
        t.float :zone4_time
    end
  end
end
