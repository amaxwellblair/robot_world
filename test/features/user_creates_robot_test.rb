require_relative '../test_helpers'

class UserCreatesRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_tries_to_create_a_new_robot

    visit '/'
    click_link("Add Robot")

    assert "/robots/new", current_path

    fill_in('robot[name]', with: "Pibbles")
    fill_in('robot[city]', with: "Bird World")
    select('Gearopolis', from: "robot[state]")
    select('Bender', from: 'robot[avatar]')
    fill_in('robot[birthdate]', with: "1 January, 2001")
    fill_in('robot[date_enslaved]', with: "1 January, 2031")
    select('Bending', from: 'robot[department]')

    click_link_or_button("Submit")

    within("#robot_test") do
      assert page.has_content?("Pibbles")
    end

    #An unathenticated user
    #Visits the home page
    #Clicks on the new robot link
    #Fills in the form
    #clicks submit
    #When created the user expects to see the robot added to the list
  end
end
