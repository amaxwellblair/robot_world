class RobotRepository
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(data)
    database.transaction do
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] ||= []
      database['robots'].push(
        {
          'id' => database['total'],
          'name' => data[:name],
          'city' => data[:city],
          'state' => data[:state],
          'avatar' => data[:avatar],
          'birthdate' => data[:birthdate],
          'date_enslaved' => data[:date_enslaved],
          'department' => data[:department]
        }
      )
    end
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_robots.map{ |robot| create_robot(robot) }
  end

  def raw_robot(id)
    database.transaction do
      database['robots'].find{ |robot| robot['id'] == id }
    end
  end

  def find(id)
    create_robot(raw_robot(id))
  end

  def update(id, data)
    database.transaction do
      raw_robot = database['robots'].find{ |raw_robot| raw_robot['id'] == id }
      raw_robot['name'] = data[:name]
      raw_robot['city'] = data[:city]
      raw_robot['state'] = data[:state]
      raw_robot['avatar'] = data[:avatar]
      raw_robot['birthdate'] = data[:birthdate]
      raw_robot['date_enslaved'] = data[:date_enslaved]
      raw_robot['department'] = data[:department]
    end
  end

  def delete(id)
    database.transaction do
      database['robots'].delete_if{ |robot| robot['id'] == id }
    end
  end

  def delete_all
    database.transaction do
      database['total'] = 0
      database['robots'] = []
    end
  end

  def create_robot(data)
    Struct::Robot.new(data['id'], data['name'], data['city'], data['state'],
                      data['avatar'], data['birthdate'], data['date_enslaved'],
                      data['department'])
  end

  Struct.new("Robot", :id, :name, :city, :state, :avatar, :birthdate, :date_enslaved, :department)
end
