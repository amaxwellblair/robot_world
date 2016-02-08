ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'
require 'tilt/erb'

  Capybara.app = RobotWorldApp
  DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/robot_world_test.sqlite3")}].strategy = :truncation

module TestHelpers

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def set_create(num = 1)
    num.times do |index|
      data = {
        name: "Rockie#{index}",
        city: "Parasite Town",
        state: "robotopia",
        avatar: "robot_chicken",
        birthdate: "1 January, 2000",
        date_enslaved: "1 January, 2030",
        department: "army"
      }
      robot_repository.create(data)
    end
  end

  def robot_repository
    database = Sequel.sqlite("db/robot_world_test.sqlite3")
    @robo_repo ||= RobotRepository.new(database)
  end

end
