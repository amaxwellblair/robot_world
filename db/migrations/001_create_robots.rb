require 'sequel'

environments = ["db/robot_world_test.sqlite3", "db/robot_world_dev.sqlite3"]

environments.each do |env|
  database = Sequel.sqlite(env)

  database.transaction do
    database.create_table(:robots) do
      primary_key :id
      String :name
      String :city
      String :state
      String :avatar
      String :birthdate
      String :date_enslaved
      String :department
    end
  end

end
