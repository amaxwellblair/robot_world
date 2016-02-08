class RobotRepository
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(data)
    database.transaction do
      database.from(:robots).insert(data)
    end
  end

  def all
    database.transaction do
      database.from(:robots).to_a.map do |raw_robot|
        create_robot(raw_robot)
      end
    end
  end

  def find(id)
    database.transaction do
      create_robot(database.from(:robots).where(:id => id).to_a.first)
    end
  end

  def update(id, data)
    database.from(:robots).where(:id => id).update(data)
  end

  def delete(id)
    database.transaction do
      database.from(:robots).where(:id => id).delete
    end
  end

  def create_robot(data)
    Struct::Robot.new(data[:id], data[:name], data[:city], data[:state],
                      data[:avatar], data[:birthdate], data[:date_enslaved],
                      data[:department])
  end

  Struct.new("Robot", :id, :name, :city, :state, :avatar, :birthdate, :date_enslaved, :department)
end
