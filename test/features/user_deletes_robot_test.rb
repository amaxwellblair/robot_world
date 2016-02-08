require_relative '../test_helpers'

class UserDeletesRobotTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_user_can_actually_delete_a_robot
    set_create

    visit '/robots'
    click_link("this_robot")
    click_button("delete")

    within("#robot_test") do
      refute page.has_content?("Rockie0")
    end

    #unathenticated user walks into a bar...
    #When visiting the show all robots page
    #clicks on a specific robot
    #When visiting the show specific robot page
    #clicks on delete
    #then expects to see the robot no longer on the page
  end

end
