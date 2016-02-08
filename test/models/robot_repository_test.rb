require_relative '../test_helpers'

class RobotRepositoryTest < Minitest::Test
  include TestHelpers

  def test_creates_a_robot
    set_create

    assert_equal "Rockie0", robot_repository.all.last.name
  end

  def test_all_returns_all_robots
    3.times{set_create}

    assert_equal 3, robot_repository.all.length
  end

  def test_find_returns_the_specifc_robot
    set_create(3)

    id = robot_repository.all.last.id

    assert_equal "Rockie2", robot_repository.find(id).name
  end

  def test_delete
    set_create(3)
    id = robot_repository.all.last.id
    # puts robot_repository.find(id)

    num_rows_deleted = robot_repository.delete(id)

    assert_equal 2, robot_repository.all.length
    assert_equal 1, num_rows_deleted
    assert_equal "Rockie1", robot_repository.all.last.name
  end

  def test_update
    set_create

    data = {
      name: "Rockie",
      city: "Parasite Town",
      state: "robotopia",
      avatar: "robot_chicken",
      birthdate: "1 January, 2000",
      date_enslaved: "1 January, 2030",
      department: "construction"
    }

    id = robot_repository.all.last.id

    robot_repository.update(id, data)
    assert_equal "construction", robot_repository.all.first.department
  end


end
