require_relative '../test_helpers'

class RobotRepositoryTest < Minitest::Test
  include TestHelpers

  def test_creates_a_robot
    set_create

    assert_equal "Rockie", robot_repository.all.last.name
  end
  
  def test_all_returns_all_robots
    3.times{set_create}

    assert_equal 3, robot_repository.all.length
  end
  #
  # def test_find_returns_the_specifc_robot
  #   3.times{set_create}
  #
  #   assert_equal 2, robot_repository.find(2).id
  # end
  #
  # def test_delete
  #   3.times{set_create}
  #
  #   robot_repository.delete(1)
  #   assert_equal 2, robot_repository.all.length
  #
  #   assert_equal 2, robot_repository.all.first.id
  # end
  #
  # def test_update
  #   set_create
  #
  #   data = {
  #     name: "Rockie",
  #     city: "Parasite Town",
  #     state: "robotopia",
  #     avatar: "robot_chicken",
  #     birthdate: "1 January, 2000",
  #     date_enslaved: "1 January, 2030",
  #     department: "construction"
  #   }
  #
  #   robot_repository.update(1, data)
  #   assert_equal "construction", robot_repository.all.first.department
  # end
  #

end
