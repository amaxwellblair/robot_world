require_relative '../test_helpers'

class UserUpdatesRobot < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_users_can_update_a_robot
    set_create
    visit '/robots'
    click_link("this_robot")
    assert '/robots/1', current_path

    click_link("Edit")

    fill_in('robot[name]', with: "Pibbles")
    fill_in('robot[city]', with: "Bird World")
    select('Gearopolis', from: "robot[state]")
    select('Bender', from: 'robot[avatar]')
    fill_in('robot[birthdate]', with: "1 January, 2001")
    fill_in('robot[date_enslaved]', with: "1 January, 2031")
    select('Bending', from: 'robot[department]')

    click_link_or_button("Submit")
    assert '/robots/1', current_path

    within("#specific_robot") do
      assert page.has_content?("Bird World")
    end



    #An unathenticated user
    #When visiting the all robots page
    #click on a specific robot
    #when visiting the specific robot page
    #click edit a specific robot
    #can edit the form
    #can submit the form
    #then expects to see the edits
    # enacted on the specific robot page
  end



end
