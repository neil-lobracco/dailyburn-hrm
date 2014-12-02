ActiveRecord::Base.connection.execute("COPY users FROM '/tmp/users.csv' DELIMITER ',' CSV HEADER;")
ActiveRecord::Base.connection.execute("COPY sessions(id,user_id,created_at,duration) from '/tmp/sessions.csv' DELIMITER ',' CSV HEADER;")
#ActiveRecord::Base.connection.execute("COPY readings(session_id,bpm,\"start\",\"end\",duration) FROM '/tmp/readings.csv' DELIMITER ',' CSV HEADER;")
