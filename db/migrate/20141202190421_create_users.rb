class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.timestamp :created_at
        t.text :username
        t.text :gender
        t.integer :age
        t.integer :zone1_min
        t.integer :zone1_max
        t.integer :zone2_min
        t.integer :zone2_max
        t.integer :zone3_min
        t.integer :zone3_max
        t.integer :zone4_min
        t.integer :zone4_max
    end
  end
end
