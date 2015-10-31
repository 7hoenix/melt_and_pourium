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

  def create_category
    visit categories_path
    click_on "Create New Category"
    fill_in("Name", with: "Gems")
    fill_in("Image Url", with: "http://gemboutiquepa.com/wp-content/uploads/2014/08/Mix4.jpg")
    click_on "Create Category"
  end

  scenario "create new categories" do
    create_admin
    admin_logs_in
    create_category

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Gems")
  end

  scenario "edit an existing category" do
    create_admin
    admin_logs_in
    create_category

    click_on "Edit Gems"
    fill_in("Name", with: "Action Figures")
    fill_in("Image Url", with: "http://www.entertainmentearth.com/images/AUTOIMAGES/DC80319AAlg.jpg")
    click_on "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Action Figures")
  end

  xscenario "delete destroys existing category" do
    create_admin
    admin_logs_in
    create_category

    click_on "Edit Gems"
    click_on "Delete Gems"
  end
end
