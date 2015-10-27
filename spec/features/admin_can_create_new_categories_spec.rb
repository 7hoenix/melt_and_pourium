require "rails_helper"

RSpec.feature "Admin can" do

  def create_admin
    User.create(email: "admin@example.com", password: "password", role: 3)
  end

  def admin_logs_in
    create_admin
    visit login_path
    fill_in("Email", with: "admin@example.com")
    fill_in("Password", with: "password")
    within(:css, "div#login_form") do
      click_on("Login")
    end
  end

  scenario "create new categories" do
    create_admin
    admin_logs_in

    click_on "Create New Category"
    fill_in("Name", with: "Gems")
    fill_in("Image Url", with: "http://gemboutiquepa.com/wp-content/uploads/2014/08/Mix4.jpg")
    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Gems")
  end
end
