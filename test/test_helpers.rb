ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'
require 'yaml/store'
require 'tilt/erb'

  Capybara.app = RobotWorldApp

module TestHelpers

  def teardown
    robot_repository.delete_all
    super
  end

  def set_create
    data = {
      name: "Rockie",
      city: "Parasite Town",
      state: "robotopia",
      avatar: "robot_chicken",
      birthdate: "1 January, 2000",
      date_enslaved: "1 January, 2030",
      department: "army"
    }
    robot_repository.create(data)
  end

  def robot_repository
    database = YAML::Store.new("db/robot_repository_test")
    @robo_repo ||= RobotRepository.new(database)
  end

end
