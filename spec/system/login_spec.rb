require "rails_helper"

RSpec.describe "Login", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password",
      admin: false
    )
  end

  it "allows a user to login successfully" do
    visit login_path

    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Mercy")
  end

  it "does not login with wrong password" do
    visit login_path

    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "wrongpassword"
    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  it "allows guest login" do
    visit root_path

    click_button "Guest Login"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Guest User")
  end

  it "allows admin guest login" do
    visit root_path

    click_button "Admin Guest Login"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Admin Dashboard")
  end
end