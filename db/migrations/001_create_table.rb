require 'sequel'

database = Sequel.sqlite("db/robot_repository_test.sqlite3")

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

#       'id' => database['total'],
#       'name' => data[:name],
#       'city' => data[:city],
#       'state' => data[:state],
#       'avatar' => data[:avatar],
#       'birthdate' => data[:birthdate],
#       'date_enslaved' => data[:date_enslaved],
#       'department' => data[:department]
