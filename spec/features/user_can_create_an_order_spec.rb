require "rails_helper"

RSpec.feature "User can place a new order" do
  def enter_info(user)
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Phone Number", with: user.phone_number
    fill_in "Street", with: "4 Park Place"
    fill_in "Apt", with: "12"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip Code", with: "80204"
  end

  scenario "after logging in and supplying valid info" do
    item = create(:item)
    user = create(:user)
    log_in(user)

    visit root_path
    click_on item.category.name
    click_on "Add #{item.name}"
    click_on "Cart"
    click_on "Check Out"
    expect(current_path).to eq(edit_user_path(user))
    enter_info(user)

    click_on "Update"
    click_on "Check Out"
    expect(current_path).to eq(new_charge_path)
  end
end
