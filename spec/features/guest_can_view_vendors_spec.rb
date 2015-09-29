require "rails_helper"

RSpec.feature "all users" do

  scenario "can see the splash page" do
    visit root_path
    click_on("Our Vendors")

    expect(current_pth).to eq(vendors_path)

    expect(page).to have_link("McDonalds")
    expect(page).to have_link("Hapa")
    expect(page).to have_link("Alinea")
  end
end
