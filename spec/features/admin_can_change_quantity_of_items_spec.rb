require "rails_helper"

RSpec.feature "admin can change quantity of items" do
  def log_in(user)
    visit root_path
    click_on("Login")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    within(:css, "div#login_form") do
      click_on("Login")
    end
  end

  scenario "when they are go to the dashboard" do
    item = create(:item)
    admin = create(:user, role: 3)
    log_in(admin)

    visit root_path
    click_on item.category.name
    click_on "Edit #{item.name}"
    fill_in "Quantity", with: 15
    click_on "Update Item"

    save_and_open_page
    expect(page).to have_content("Quantity: 15")
  end
end
